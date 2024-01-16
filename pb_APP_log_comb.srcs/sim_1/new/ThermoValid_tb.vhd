----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 04:35:56 PM
-- Design Name: 
-- Module Name: ThermoValid_tb - Behavioral
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

entity ThermoValid_tb is
--  Port ( );
end ThermoValid_tb;

architecture Behavioral of ThermoValid_tb is

    
    component ThermoValid 
        port (
            adc12_in : in std_logic_vector(11 downto 0);
            err_out : out std_logic
        );
    end component;
    
    CONSTANT PERIOD    : time := 10 ns;
    
    signal adc12_sim : std_logic_vector(11 downto 0) := "000000000000";
    signal err_sim : std_logic := '0';
    
begin
    
    uut : ThermoValid
    port map(
        adc12_in => adc12_sim,
        err_out => err_sim
    );
    
    tb : process
    begin
    
        adc12_sim <= "000000000000";
        wait for PERIOD;
        adc12_sim <= "000000000001";
        wait for PERIOD;
        adc12_sim <= "000000000011";
        wait for PERIOD;
        adc12_sim <= "000000000111";
        wait for PERIOD;
        adc12_sim <= "000000001111";
        wait for PERIOD;
        adc12_sim <= "000000011111";
        wait for PERIOD;
        adc12_sim <= "000000111111";
        wait for PERIOD;
        adc12_sim <= "000001111111";
        wait for PERIOD;
        adc12_sim <= "000011111111";
        wait for PERIOD;
        adc12_sim <= "000111111111";
        wait for PERIOD;
        adc12_sim <= "001111111111";
        wait for PERIOD;
        adc12_sim <= "011111111111";
        wait for PERIOD;
        adc12_sim <= "111111111111";
        wait for PERIOD;
        
        adc12_sim <= "000000000010";
        wait for PERIOD;
        adc12_sim <= "000000000100";
        wait for PERIOD;
        adc12_sim <= "000000001000";
        wait for PERIOD;
        adc12_sim <= "001000000000";
        wait for PERIOD;
        adc12_sim <= "010000000000";
        wait for PERIOD;
        adc12_sim <= "100000000000";
        wait for PERIOD;
        
        adc12_sim <= "000000000101";
        wait for PERIOD;
        adc12_sim <= "000000001001";
        wait for PERIOD;
        adc12_sim <= "000000010001";
        wait for PERIOD;
        adc12_sim <= "001000000001";
        wait for PERIOD;
        adc12_sim <= "010000000001";
        wait for PERIOD;
        adc12_sim <= "100000000001";
        wait for PERIOD;
        
        
        adc12_sim <= "111111111110";
        wait for PERIOD;
        adc12_sim <= "111111111101";
        wait for PERIOD;
        adc12_sim <= "111111111011";
        wait for PERIOD;
        adc12_sim <= "111011111111";
        wait for PERIOD;
        adc12_sim <= "110111111111";
        wait for PERIOD;
        adc12_sim <= "101111111111";
        wait for PERIOD;
        
        
        adc12_sim <= "100000000000";
        wait for PERIOD;
        adc12_sim <= "110000000000";
        wait for PERIOD;
        adc12_sim <= "111000000000";
        wait for PERIOD;
        adc12_sim <= "111100000000";
        wait for PERIOD;
        adc12_sim <= "111110000000";
        wait for PERIOD;
        adc12_sim <= "111111111000";
        wait for PERIOD;
        adc12_sim <= "111111111100";
        wait for PERIOD;
        adc12_sim <= "111111111110";
        wait for PERIOD;
    wait; -- infinit wait (test over)
    end process; -- end of test bench


end Behavioral;
