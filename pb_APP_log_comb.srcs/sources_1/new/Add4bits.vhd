----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/13/2024 01:25:47 PM
-- Design Name: 
-- Module Name: Add4bits - Behavioral
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

entity Add4bits is
    Port ( aVect : in STD_LOGIC_VECTOR(3 downto 0);
           bVect : in STD_LOGIC_VECTOR(3 downto 0);
           cin : in STD_LOGIC;
           sVect : out STD_LOGIC_VECTOR(3 downto 0);
           cout : out STD_LOGIC);
end Add4bits;

architecture Behavioral of Add4bits is

    signal carry_vect : std_logic_vector(4 downto 0);
    
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
    carry_vect(0) <= cin;
    cout <= carry_vect(4);
    
    -- connecting the four 1bit adders
    bit0 : Add1bitB
    port map (
        a => aVect(0),
        b => bVect(0),
        ci => carry_vect(0),
        s => sVect(0),
        co => carry_vect(1)
    );
    bit1 : Add1bitB
    port map (
        a => aVect(1),
        b => bVect(1),
        ci => carry_vect(1),
        s => sVect(1),
        co => carry_vect(2)
    );
    bit2 : Add1bitB
    port map (
        a => aVect(2),
        b => bVect(2),
        ci => carry_vect(2),
        s => sVect(2),
        co => carry_vect(3)
    );
    bit3 : Add1bitB
    port map (
        a => aVect(3),
        b => bVect(3),
        ci => carry_vect(3),
        s => sVect(3),
        co => carry_vect(4)
    );
    

end Behavioral;
