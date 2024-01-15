----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 11:54:38 AM
-- Design Name: 
-- Module Name: Fct2_3_tb - Behavioral
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
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fct2_3_tb is
--  Port ( );
end Fct2_3_tb;

architecture Behavioral of Fct2_3_tb is

    CONSTANT PERIOD    : time := 10 ns;
    
    component Fct2_3 
        port (
            ADCbin_in : in STD_LOGIC_VECTOR(3 downto 0);
            A2_3_out : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;
    
    signal bit4_sim : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal bit3_sim : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin

    uut : Fct2_3
    port map(
        ADCbin_in => bit4_sim,
        A2_3_out => bit3_sim
    );

    
    tb : process
    begin
        bit4_sim <= "0000";
        wait for PERIOD;
        bit4_sim <= "0001";
        wait for PERIOD;
        bit4_sim <= "0010";
        wait for PERIOD;
        bit4_sim <= "0011";
        wait for PERIOD;
        bit4_sim <= "0100";
        wait for PERIOD;
        bit4_sim <= "0101";
        wait for PERIOD;
        bit4_sim <= "0110";
        wait for PERIOD;
        bit4_sim <= "0111";
        wait for PERIOD;
        bit4_sim <= "1000";
        wait for PERIOD;
        bit4_sim <= "1001";
        wait for PERIOD;
        bit4_sim <= "1010";
        wait for PERIOD;
        bit4_sim <= "1011";
        wait for PERIOD;
        bit4_sim <= "1100";
        wait for PERIOD;
        bit4_sim <= "1101";
        wait for PERIOD;
        bit4_sim <= "1110";
        wait for PERIOD;
        bit4_sim <= "1111";
        
        -- do test here
        
    wait; -- infinit wait (test over)
    end process; -- end of test bench
    
end Behavioral;
