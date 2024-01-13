----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/12/2024 09:37:42 AM
-- Design Name: 
-- Module Name: Add1bitA - Behavioral
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

entity Add1bitA is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           ci : in STD_LOGIC;
           s : out STD_LOGIC;
           co : out STD_LOGIC);
end Add1bitA;

architecture Behavioral of Add1bitA is

    signal input_vect             : std_logic_vector (2 downto 0):= "000";
begin
    input_vect <= a & b & ci;
    
    process(input_vect) is
    begin
        case input_vect is
            when "000" => s <= '0'; co <= '0';
            when "001" => s <= '1'; co <= '0';
            when "010" => s <= '1'; co <= '0';
            when "011" => s <= '0'; co <= '1';
            when "100" => s <= '1'; co <= '0';
            when "101" => s <= '0'; co <= '1';
            when "110" => s <= '0'; co <= '1';
            when "111" => s <= '1'; co <= '1';
            
            when others => s <= '0'; co <= '0';
        end case;
    end process;


end Behavioral;
