----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 02:37:42 PM
-- Design Name: 
-- Module Name: Parite - Behavioral
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

entity Parite is
    Port ( ADCbin : in std_logic_vector(3 downto 0);
           S1 : in STD_LOGIC; -- 1 pour impaire, 0 pour paire
           Parite_out : out STD_LOGIC);
end Parite;

architecture Behavioral of Parite is
    signal result : std_logic := '0';
    
begin

    process(ADCbin) is
    begin
        case ADCbin is
            when "0000" => result <= '0';
            when "0001" => result <= '1';
            when "0010" => result <= '1';
            when "0011" => result <= '0';
            when "0100" => result <= '1';
            when "0101" => result <= '0';
            when "0110" => result <= '0';
            when "0111" => result <= '1';
            
            when "1000" => result <= '1';
            when "1001" => result <= '0';
            when "1010" => result <= '0';
            when "1011" => result <= '1';
            when "1100" => result <= '0';
            when "1101" => result <= '1';
            when "1110" => result <= '1';
            when "1111" => result <= '0';
            
            when others => result <= '0';
        end case;
    end process;
    
    Parite_out <= result XOR S1;
    


end Behavioral;
