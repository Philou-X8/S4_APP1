----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 01:29:08 PM
-- Design Name: 
-- Module Name: Add4bits_tb - Behavioral
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

entity Add4bits_tb is
--  Port ( );
end Add4bits_tb;

architecture Behavioral of Add4bits_tb is

    component Add4bits 
        port (
            aVect : in STD_LOGIC_VECTOR(3 downto 0);
            bVect : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            sVect : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;
    
    CONSTANT PERIOD    : time := 10 ns;

    signal resul_sim : std_logic_vector(3 downto 0) := "0000";
    signal carry_sim :STD_LOGIC := '0';
    
    signal aVect_sim : std_logic_vector(3 downto 0) := "0000";
    signal bVect_sim : std_logic_vector(3 downto 0) := "0000";
    
begin

    uut : Add4bits
    port map (
        aVect => aVect_sim,
        bVect => bVect_sim,
        cin => '0', -- unused bit
        sVect => resul_sim,
        cout => carry_sim -- unused bit
    );
    
    
    tb : process
    begin
        bVect_sim <= "0001";
    
        wait for PERIOD;
        aVect_sim <= "0000";
        wait for PERIOD;
        aVect_sim <= "0001";
        wait for PERIOD;
        aVect_sim <= "0010";
        wait for PERIOD;
        aVect_sim <= "0011";
        wait for PERIOD;
        aVect_sim <= "0100";
        wait for PERIOD;
        aVect_sim <= "0101";
        wait for PERIOD;
        aVect_sim <= "0110";
        wait for PERIOD;
        aVect_sim <= "0111";
        wait for PERIOD;
        aVect_sim <= "1000";
        wait for PERIOD;
        aVect_sim <= "1001";
        wait for PERIOD;
        aVect_sim <= "1010";
        wait for PERIOD;
        aVect_sim <= "1011";
        wait for PERIOD;
        aVect_sim <= "1100";
        wait for PERIOD;
        aVect_sim <= "1101";
        wait for PERIOD;
        aVect_sim <= "1110";
        wait for PERIOD;
        aVect_sim <= "1111";
        
        
        wait for PERIOD;
        
        -- do test here
        
    wait; -- infinit wait (test over)
    end process; -- end of test bench


end Behavioral;
