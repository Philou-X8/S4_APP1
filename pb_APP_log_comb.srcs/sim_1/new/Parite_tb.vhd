----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 03:51:06 PM
-- Design Name: 
-- Module Name: Parite_tb - Behavioral
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

entity Parite_tb is
--  Port ( );
end Parite_tb;

architecture Behavioral of Parite_tb is
    
    component Parite 
        port (
            ADCbin : in std_logic_vector(3 downto 0);
            S1 : in STD_LOGIC; -- 1 pour impaire, 0 pour paire
            Parite_out : out STD_LOGIC
        );
    end component;
    
    CONSTANT PERIOD    : time := 10 ns;
    
    signal ADCbin_sim : std_logic_vector(3 downto 0) := "0000";
    signal S1_sim : std_logic := '0';
    signal Parite_sim : std_logic := '0';
    
begin
    
    uut : Parite
    port map(
        ADCbin => ADCbin_sim,
        S1 => S1_sim,
        Parite_out => Parite_sim
    );
    
    
    tb : process
    begin
        ADCbin_sim <= "0000";
        wait for PERIOD;
        ADCbin_sim <= "0001";
        wait for PERIOD;
        ADCbin_sim <= "0010";
        wait for PERIOD;
        ADCbin_sim <= "0011";
        wait for PERIOD;
        ADCbin_sim <= "0100";
        wait for PERIOD;
        ADCbin_sim <= "0101";
        wait for PERIOD;
        ADCbin_sim <= "0110";
        wait for PERIOD;
        ADCbin_sim <= "0111";
        wait for PERIOD;
        ADCbin_sim <= "1000";
        wait for PERIOD;
        ADCbin_sim <= "1001";
        wait for PERIOD;
        ADCbin_sim <= "1010";
        wait for PERIOD;
        ADCbin_sim <= "1011";
        wait for PERIOD;
        ADCbin_sim <= "1100";
        wait for PERIOD;
        ADCbin_sim <= "1101";
        wait for PERIOD;
        ADCbin_sim <= "1110";
        wait for PERIOD;
        ADCbin_sim <= "1111";
        
    wait; -- infinit wait (test over)
    end process; -- end of test bench
    
    

end Behavioral;
