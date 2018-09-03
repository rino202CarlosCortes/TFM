----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.07.2018 19:11:48
-- Design Name: 
-- Module Name: signal_divider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity signal_divider is
    Port ( signal_in : in STD_LOGIC;
            rst_in : in std_logic;
           divided_out : out STD_LOGIC);
end signal_divider;

architecture Behavioral of signal_divider is
signal outsignal : std_logic;
begin
process(rst,signal_in):
if rst = '1' then
else
if (signal_in)
end if;
    
end process;


end Behavioral;
