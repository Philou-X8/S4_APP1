----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 10:45:42 AM
-- Design Name: 
-- Module Name: Add1BitB_tb - Behavioral
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

entity Add1bitB_tb is
    -- Port ( );
end Add1bitB_tb;

architecture Behavioral of Add1bitB_tb is

    signal a_sim : STD_LOGIC;
    signal b_sim : STD_LOGIC;
    signal ci_sim : STD_LOGIC;
    signal s_sim : STD_LOGIC;
    signal co_sim : STD_LOGIC;

    component Add1bitB 
        port (
            a : in STD_LOGIC;
            b : in STD_LOGIC;
            ci : in STD_LOGIC;
            s : out STD_LOGIC;
            co : out STD_LOGIC 
        );
    end component;

begin

    uut : Add1bitB
    port map (
        a => a_sim,
        b => b_sim,
        ci => ci_sim,
        s => s_sim,
        co => co_sim
    );

    tb : process
    begin
        wait for 10ns;
        a_sim <= '0';
        b_sim <= '0';
        ci_sim <= '0';
        wait for 10ns;
        a_sim <= '0';
        b_sim <= '1';
        ci_sim <= '0';
        wait for 10ns;
        a_sim <= '1';
        b_sim <= '1';
        ci_sim <= '0';
        wait for 10ns;
        
        -- do test here
        
    wait; -- infinit wait (test over)
    end process; -- end of test bench
end Behavioral;
