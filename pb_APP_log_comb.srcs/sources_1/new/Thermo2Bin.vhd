----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 09:45:29 AM
-- Design Name: 
-- Module Name: Thermo2Bin - Behavioral
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

entity Thermo2Bin is
    Port ( adc12_vect : in STD_LOGIC_VECTOR(11 downto 0);
           adc4_vect : out STD_LOGIC_VECTOR(3 downto 0);
           err_b : out STD_LOGIC);
end Thermo2Bin;

architecture Behavioral of Thermo2Bin is

    component ThermoBitCounter 
        port (
            thermo_block_in : in STD_LOGIC_VECTOR(3 downto 0);
            thermo_block_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    component ThermoValid 
        port (
            adc12_in : in std_logic_vector(11 downto 0);
            err_out : out std_logic
        );
    end component;
    
    component Add4bits 
        port (
            aVect : in STD_LOGIC_VECTOR(3 downto 0);
            bVect : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            sVect : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;
    
    signal block0_sum : std_logic_vector(3 downto 0) := adc12_vect(3 downto 0);
    signal block1_sum : std_logic_vector(3 downto 0) := adc12_vect(7 downto 4);
    signal block2_sum : std_logic_vector(3 downto 0) := adc12_vect(11 downto 8);
    signal block_buff : std_logic_vector(3 downto 0) := "0000";
    
begin

    -- ENCODE 12 TO 4 -- START --
    block0 : ThermoBitCounter
    port map (
        thermo_block_in => adc12_vect(3 downto 0),
        thermo_block_out => block0_sum
    );
    block1 : ThermoBitCounter
    port map (
        thermo_block_in => adc12_vect(7 downto 4),
        thermo_block_out => block1_sum
    );
    block2 : ThermoBitCounter
    port map (
        thermo_block_in => adc12_vect(11 downto 8),
        thermo_block_out => block2_sum
    );
    
    block_adder_0 : Add4bits
    port map (
        aVect => block0_sum,
        bVect => block1_sum,
        cin => block0_sum(3), -- unused bit
        sVect => block_buff,
        cout => block1_sum(3) -- unused bit
    );
    block_adder_2 : Add4bits
    port map (
        aVect => block_buff,
        bVect => block2_sum,
        cin => block0_sum(3), -- unused bit
        sVect => adc4_vect,
        cout => block2_sum(3) -- unused bit
    );
    -- ENCODE 12 TO 4 -- END --
    
    -- CHECK FORMATING -- START --
    
    formating : ThermoValid
    port map(
        adc12_in => adc12_vect,
        err_out => err_b
    );
    -- CHECK FORMATING -- END --
end Behavioral;
