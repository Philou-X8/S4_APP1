----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 11:28:26 AM
-- Design Name: 
-- Module Name: Fct2_3 - Behavioral
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Fct2_3 is
    Port ( 
        ADCbin_in : in STD_LOGIC_VECTOR(3 downto 0);
        A2_3_out : out STD_LOGIC_VECTOR(2 downto 0)
        );
end Fct2_3;

architecture Behavioral of Fct2_3 is
    signal buff1_8 : STD_LOGIC_VECTOR(3 downto 0);
    signal buff4_8 : STD_LOGIC_VECTOR(3 downto 0);
    signal buff4bit : STD_LOGIC_VECTOR(3 downto 0);
    
    component Add4bits 
        port (
            aVect : in STD_LOGIC_VECTOR(3 downto 0);
            bVect : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            sVect : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;
    
begin
    
    buff4_8 <= '0' & ADCbin_in(3 downto 1); -- bit shift once (equals 4/8)
    buff1_8 <= "000" & ADCbin_in(3); -- bit shift 3 times (equal 1/8)
    
    adder4bit : Add4bits -- sum both bit shift (equals 5/8, close to 2/3)
    port map (
        aVect => buff1_8,
        bVect => buff4_8,
        cin => ADCbin_in(0), -- round up on 0.5
        sVect => buff4bit,
        cout => buff4bit(3) -- unused bit
    );
    A2_3_out <= buff4bit(2 downto 0);

end Behavioral;
