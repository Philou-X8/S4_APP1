----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 05:24:51 PM
-- Design Name: 
-- Module Name: ThermoBitCounter_tb - Behavioral
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

entity ThermoBitCounter_tb is
--  Port ( );
end ThermoBitCounter_tb;

architecture Behavioral of ThermoBitCounter_tb is

    component ThermoBitCounter 
        port (
            thermo_block_in : in STD_LOGIC_VECTOR(3 downto 0);
            thermo_block_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    CONSTANT PERIOD    : time := 10 ns;
    
    signal adc12_sim : std_logic_vector(11 downto 0) := "000000000000";
    signal adc4_sim : std_logic_vector(3 downto 0) := "0000";
    
begin
    uut : ThermoBitCounter
    port map (
        thermo_block_in => adc12_sim(3 downto 0),
        thermo_block_out => adc4_sim
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
        
        
    wait; -- infinit wait (test over)
    end process; -- end of test bench


end Behavioral;
