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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
end test;

architecture Behavioral of test is
 component test is Port (
          ENABLE : in STD_LOGIC;
          CLK          : in  STD_LOGIC;
          LED             : out  STD_LOGIC_VECTOR (5 downto 0);
          uart_rxd_out     : out  STD_LOGIC;
          --           led0_r        : out  STD_LOGIC;
          --           led0_g       : out  STD_LOGIC;
          --           led0_b       : out  STD_LOGIC;    
          --           led1_r        : out  STD_LOGIC;
          --           led1_g        : out  STD_LOGIC;
          --           led1_b        : out  STD_LOGIC;
                        
                        --eocsignal : out std_logic;
                        SW : in std_logic_vector(3 downto 0)
                        );
                        end component;
component fifo_generator_0 IS
  PORT (
    clk : IN STD_LOGIC;
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
signal data : std_logic_vector(7 downto 0);
signal store,lleno,uart_rxd_out,mersede,transmite,store2,vacia2,escribeenfifo,vacia,vacio,palgo,fintransmision,reset : std_logic;
signal datotransmitir : std_logic_vector(7 downto 0);
signal counter : unsigned(7 downto 0) := "00000000";
signal CLK :std_logic;
-- countereoc : integer range 0 to 124999 := 0;
constant period : time := 10ns;
constant periodeoc : time := 1us;
begin
TX : UART_TX generic map(
    g_CLKS_PER_BIT => 868
) port map(
     
    i_Clk      => CLK,
    i_TX_DV     => transmite,
    i_TX_Byte   => datotransmitir,
    o_TX_Active => palgo,
    o_TX_Serial => uart_rxd_out,
    o_TX_Done   => fintransmision



);

FIFO : fifo_generator_0 port map(
    clk => mersede,
    rst => reset,
    din => data,
    wr_en => store2,
    rd_en =>vacia2,
    dout => datotransmitir,
    full => lleno,
    empty => vacio
);


--vacia2 <= vacia and(lleno or fintransmision);
--store2 <= escribeenfifo and (vacio or store);
vacia2 <= '1' when transmite = '1' else '0';
store2 <= '1' when escribeenfifo = '1' else '0';
--reset <= '1' when SW(0) = '1' else '0';
--eocsignal <= store;
mersede <= store when escribeenfifo = '1' else fintransmision;
--led(4)<=lleno;
--led(5)<=vacio;
--process(CLK)
--begin
--if(escribeenfifo = '1' and store = '1' and rising_edge(CLK) and store2 = '0' )then
--  
---   store2 <= '1';
--    else
--      if falling_edge() then store2 = '0'
--end if;
--end process;
process(CLK,lleno,vacio,reset)
begin
    if (rising_edge(CLK)) then
        if lleno = '1' then
            vacia <= '1';
            transmite <= '1';
            escribeenfifo <='0';
        end if;
            if vacio = '1' then
            vacia <= '0';
            transmite <= '0';
            escribeenfifo <='1';
        end if;
    end if;
end process;
process
begin
 CLK <= '0';
 wait for period/2;
 CLK <= '1';
 wait for period/2;
 end process;
 
 process
 begin
  store <= '0';
  wait for periodeoc/2;
  store <= '1';
  wait for periodeoc/2;
  end process;
 
 
 process
     begin
        reset<= '1';
     wait for 10ms;
        reset <= '0';
     wait;
end process;
data <= std_logic_vector(counter);
process (store)
 begin
    if (reset = '1') then
        counter <=  (others=>'0');
    else
         counter <= counter + 1;
         if(counter = 256) then 
             counter <=  (others=>'0');
         end if;
    end if;
 
 end process;
end Behavioral;
