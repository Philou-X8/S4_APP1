----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 02:18:03 PM
-- Design Name: 
-- Module Name: Decodeur3_8_tb - Behavioral
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

entity Decodeur3_8_tb is
--  Port ( );
end Decodeur3_8_tb;

architecture Behavioral of Decodeur3_8_tb is
    
    component Decodeur3_8 
        port (
            A2_3_in : in std_logic_vector(2 downto 0);
            LED_vect_out : out std_logic_vector(7 downto 0)
        );
    end component;
    
    CONSTANT PERIOD    : time := 10 ns;
    
    signal A2_3_sim : std_logic_vector(2 downto 0) := "000";
    signal LED_sim : std_logic_vector(7 downto 0) := "00000001";

begin

    uut : Decodeur3_8
    port map(
        A2_3_in => A2_3_sim,
        LED_vect_out => LED_sim
    );
    
    
    tb : process
    begin
        --LED_sim <= "00000001";
    
        A2_3_sim <= "000";
        wait for PERIOD;
        A2_3_sim <= "001";
        wait for PERIOD;
        A2_3_sim <= "010";
        wait for PERIOD;
        A2_3_sim <= "011";
        wait for PERIOD;
        A2_3_sim <= "100";
        wait for PERIOD;
        A2_3_sim <= "101";
        wait for PERIOD;
        A2_3_sim <= "110";
        wait for PERIOD;
        A2_3_sim <= "111";
        wait for PERIOD;
        
        
    wait; -- infinit wait (test over)
    end process; -- end of test bench



end Behavioral;
