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
    
begin
    
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
        
end Behavioral;
