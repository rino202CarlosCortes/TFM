----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.07.2018 17:27:40
-- Design Name: 
-- Module Name: TFM - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TFM is
    Port (
           ENABLE : in STD_LOGIC;
           CLK      	: in  STD_LOGIC;
           LED             : out  STD_LOGIC_VECTOR (5 downto 0);
           uart_rxd_out     : out  STD_LOGIC;
           --           led0_r        : out  STD_LOGIC;
           --           led0_g       : out  STD_LOGIC;
           --           led0_b       : out  STD_LOGIC;    
           --           led1_r        : out  STD_LOGIC;
           --           led1_g        : out  STD_LOGIC;
           --           led1_b        : out  STD_LOGIC;
                      vp_in : in std_logic;
                      vn_in : in std_logic;
                      vauxp0 : in std_logic;
                         vauxn0 : in std_logic;
                         eocsignal : out std_logic;
                         pin_digital : in std_logic;
                         SW : in std_logic_vector(3 downto 0)
                         );
           
           
end TFM;

architecture Behavioral of TFM is
component XADCdemo
Port(
   CLK100MHZ : in std_logic;
    vauxp0 : in std_logic;
    vauxn0 : in std_logic;
    vp_in : in std_logic;
    vn_in : in std_logic;
    canal : in std_logic_vector(3 downto 0);
    data : out std_logic_vector(15 downto 0);
    eoc : out std_logic
);
end component;
component counter_freq IS
  PORT (
    CLK : IN STD_LOGIC;
    CE : IN STD_LOGIC;
    SCLR : IN STD_LOGIC;
    Q : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END component;
component pulse_counter is
port ( DAT_O : out unsigned(47 downto 0);
        ERR_O : out std_logic;  --This is '1' if the pulse freq is more than clk freq.
        Pulse_I : in std_logic;
        rst : in std_logic;  
      CLK_I : in std_logic
    );
    end component;
component fifo_generator_0 IS
  PORT (
    rd_clk : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;    
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END component;
component  UART_TX is
  generic (
    g_CLKS_PER_BIT : integer := 868     -- Needs to be set correctly
    );
  port (
    i_Clk       : in  std_logic;
    i_TX_DV     : in  std_logic;
    i_TX_Byte   : in  std_logic_vector(7 downto 0);
    o_TX_Active : out std_logic;
    o_TX_Serial : out std_logic;
    o_TX_Done   : out std_logic
    );
end component;
signal data : std_logic_vector(15 downto 0);
signal store,lleno,writeclk,readclk,transmite,store2,vacia2,escribeenfifo,vacia,vacio,palgo,fintransmision,reset : std_logic;
signal adcosierra : std_logic_vector(7 downto 0);
signal dato_frecuencia : unsigned(47 downto 0);
signal dato_frecuencia_std : std_logic_vector(47 downto 0);
type YOUR_ARRAY_TYPE is array (0 to 5) of std_logic_vector(7 downto 0);
signal freq_count:std_logic_vector(2 downto 0);
signal cadenafrecuencia : YOUR_ARRAY_TYPE;
type state_type is (S0, S1,S2); 
signal state, next_state,state_freq,next_statefreq : state_type; 
signal datotransmitir,fifoout : std_logic_vector(7 downto 0);
signal canal_ADC : std_logic_vector(3 downto 0);
signal frecuencia,freq_done,errorfreq : std_logic;
signal pindigital_next : std_logic := '0';
begin
ADC : XADCdemo port map(
        CLK100MHZ => CLK,
        vauxp0  => vauxp0,
        vauxn0  => vauxn0,
        vp_in => vp_in,
        vn_in =>vn_in,
        canal  =>canal_ADC,
        data => data,
        eoc => store
);
--frecuencimetro : Frecuency_meter
--Port map (
--    clk100 => CLK,
--    reset => reset,
--    transmite => medir_frecuencia,
--    input_signal => pin_digital,
--    dato_frecuencia => dato_frecuencia
-- );
counterfrequency : counter_freq port map(
    CLK => fintransmision,
    CE => frecuencia,
    SCLR => freq_done,
    Q => freq_count
  );
TX : UART_TX generic map(
    g_CLKS_PER_BIT => 87
) port map(
     
    i_Clk      => CLK,
    i_TX_DV     => transmite,
    i_TX_Byte   => datotransmitir,
    o_TX_Active => palgo,
    o_TX_Serial => uart_rxd_out,
    o_TX_Done   => fintransmision

);
medirfrecuencia : pulse_counter port map(
        DAT_O => dato_frecuencia,
        ERR_O => errorfreq,  --This is '1' if the pulse freq is more than clk freq.
        Pulse_I => pindigital_next,--pin_digital, 
        rst => reset, 
        CLK_I => CLK
    );

FIFO : fifo_generator_0 port map(
    rd_clk => readclk,
    wr_clk => writeclk,
    rst => reset,
    din => adcosierra,--data(15 downto 8 ),
    wr_en => store2,
    rd_en =>vacia2,
    dout => fifoout,
    full => lleno,
    empty => vacio
);
SYNC_PROC : process (clk) 
begin 
      
      if rising_edge(clk) then 
            if (reset = '1') then 
                  state <= S0;
                  state_freq <= S0;
                  pindigital_next <= '0';
            else 
                  state <= next_state; 
                  state_freq <= next_statefreq;
                  if(pin_digital = '0') then
                    pindigital_next <= '0';
                  else
                    pindigital_next <= '1';
                  end if;
            end if; 
      end if; 
end process; 
NEXT_STATE_DECODE : process (state,freq_done,lleno,vacio,freq_done) 
begin 
    -- aquí se pone el valor por defecto de las salidas 
      case (state) is 
             when S0 =>
                    if(freq_done = '1') then
                        store2 <= '1';
                        vacia2 <= '0';
                        frecuencia <= '0';
                        next_state<=S1;
                    else
                        next_state<=S0;
                        store2<= '0';
                        vacia2 <='0';
                        frecuencia <= '1';
                        
                    end if; 
            when S1 => 
                  if (lleno = '1') then 
                        store2 <= '0';
                        vacia2 <= '1';
                        frecuencia <= '0'; 
                        next_state <= S2; 
                  else 
                        store2 <= '1';
                        vacia2 <= '0';
                        frecuencia <= '0';
                        next_state<=S1;
                  end if; 
            when S2 => 
                  if (vacio = '1') then
                        next_state<=S0;
                        store2<= '0';
                        vacia2 <='0';
                        frecuencia <= '1';
                  else 
                        store2 <= '0';
                        vacia2 <= '1';
                        frecuencia <= '0'; 
                        next_state <= S2; 
                  end if; 
            when others => 
                  next_state <= S0; 
                  store2<= '0';
                  vacia2 <='0';
                  frecuencia <= '1';
            end case;
end process; 
NEXT_STATE_DECODE_FREQ : process (state_freq,frecuencia,freq_count) 
begin 
    -- aquí se pone el valor por defecto de las salidas 

   -- else
      case (state_freq) is 
             when S0 =>
                    if(frecuencia = '1') then
                        freq_done <= '0';
                        next_statefreq<=S1;
                    else
                        next_statefreq<=S0;
                        freq_done <= '0';
                        
                    end if; 
            when S1 => 
                  if (freq_count = "101") then 
                        next_statefreq<=S2;
                        freq_done <= '1';
                  else 
                        freq_done <= '0';
                        next_statefreq<=S1;
                  end if; 
            when S2 => 
                next_statefreq <= S0; -- aguanta done por 1 CLK
                freq_done <= '1';
            when others => 
                  next_statefreq<=S0;
                  freq_done <= '0';
            end case; 
end process; 




LED<= "000"& frecuencia & vacio  & reset;
writeclk <= store;
readclk <= fintransmision;
transmite <= vacia2 or  frecuencia;
dato_frecuencia_std <= std_logic_vector(dato_frecuencia) ;
cadenafrecuencia(0)<= "11111111";
cadenafrecuencia(1)<= "01111111";
--cadenafrecuencia(1)<= dato_frecuencia_std(31 downto 24);
cadenafrecuencia(2)<= dato_frecuencia_std(23 downto 16);
cadenafrecuencia(3)<= dato_frecuencia_std(15 downto 8);
cadenafrecuencia(4)<=dato_frecuencia_std(7 downto 0);
datotransmitir <= fifoout when frecuencia = '0' else cadenafrecuencia(to_integer(unsigned(freq_count)));
reset <= '1' when SW(0) = '1' else '0';
--eocsignal <= pin_digital;
adcosierra <= data(15 downto 8);
canal_ADC <= "0000" when SW(1) = '0' else "1000";
end Behavioral;
