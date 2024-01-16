----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 03:03:11 PM
-- Design Name: 
-- Module Name: Moins_5 - Behavioral
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

entity Moins_5 is
    Port ( ADCBin : in STD_LOGIC_VECTOR (3 downto 0);
           Moins5 : out STD_LOGIC_VECTOR (3 downto 0));
end Moins_5;

architecture Behavioral of Moins_5 is

component Add4bits is
    Port ( aVect : in STD_LOGIC_VECTOR(3 downto 0);
           bVect : in STD_LOGIC_VECTOR(3 downto 0);
           cin : in STD_LOGIC;
           sVect : out STD_LOGIC_VECTOR(3 downto 0);
           cout : out STD_LOGIC);
end component;

signal cout_sim : std_logic := '0';

begin
    
    Moins_5 : Add4bits
    port map(
        aVect => ADCBin,
        bVect => "1011",
        cin => '0',
        sVect => Moins5,
        cout => cout_sim
        );
        
end Behavioral;
