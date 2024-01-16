----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 04:09:11 PM
-- Design Name: 
-- Module Name: ThermoValid - Behavioral
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

entity ThermoValid is
    Port ( adc12_in : in STD_LOGIC_VECTOR(11 downto 0);
           err_out : out STD_LOGIC);
end ThermoValid;

architecture Behavioral of ThermoValid is
    
    
    component Add4bits 
        port (
            aVect : in STD_LOGIC_VECTOR(3 downto 0);
            bVect : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            sVect : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;
    
    signal carry1 : std_logic;
    signal carry2 : std_logic;
    signal carry3 : std_logic;
    signal sum_vect : std_logic_vector(11 downto 0) := "000000000000";
    signal adc12_neg : std_logic_vector(11 downto 0) := "111111111111";

begin
    adc12_neg <= adc12_in XOR "111111111111";
    adder1 : Add4bits
    port map (
        aVect => adc12_in(3 downto 0),
        bVect => adc12_neg(3 downto 0),
        cin => '1',
        sVect => sum_vect(3 downto 0),
        cout => carry1
    );
    adder2 : Add4bits
    port map (
        aVect => adc12_in(7 downto 4),
        bVect => adc12_neg(7 downto 4),
        cin => carry1,
        sVect => sum_vect(7 downto 4),
        cout => carry2
    );
    adder3 : Add4bits
    port map (
        aVect => adc12_in(11 downto 8),
        bVect => adc12_neg(11 downto 8),
        cin => carry2,
        sVect => sum_vect(11 downto 8),
        cout => carry3
    );
    err_out <= 
        ( adc12_in(1) AND (NOT adc12_in(0)) ) OR
        ( adc12_in(2) AND (NOT adc12_in(1)) ) OR
        ( adc12_in(3) AND (NOT adc12_in(2)) ) OR
        ( adc12_in(4) AND (NOT adc12_in(3)) ) OR
        ( adc12_in(5) AND (NOT adc12_in(4)) ) OR
        ( adc12_in(6) AND (NOT adc12_in(5)) ) OR
        ( adc12_in(7) AND (NOT adc12_in(6)) ) OR
        ( adc12_in(8) AND (NOT adc12_in(7)) ) OR
        ( adc12_in(9) AND (NOT adc12_in(8)) ) OR
        ( adc12_in(10) AND (NOT adc12_in(9)) ) OR
        ( adc12_in(11) AND (NOT adc12_in(10)) ) ;
        
    
    
    --err_out <= NOT carry3;


end Behavioral;
