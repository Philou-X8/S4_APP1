----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 02:06:02 PM
-- Design Name: 
-- Module Name: Decodeur3_8 - Behavioral
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

entity Decodeur3_8 is
    Port ( A2_3_in : in std_logic_vector(2 downto 0);
           LED_vect_out : out std_logic_vector(7 downto 0));
end Decodeur3_8;

architecture Behavioral of Decodeur3_8 is

begin
    LED_vect_out <= "00000001" when A2_3_in = "000"
               else "00000010" when A2_3_in = "001"
               else "00000100" when A2_3_in = "010"
               else "00001000" when A2_3_in = "011"
               else "00010000" when A2_3_in = "100"
               else "00100000" when A2_3_in = "101"
               else "01000000" when A2_3_in = "110"
               else "10000000" when A2_3_in = "111";

end Behavioral;
