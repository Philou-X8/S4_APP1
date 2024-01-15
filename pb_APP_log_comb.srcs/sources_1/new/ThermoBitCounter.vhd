----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 09:52:54 AM
-- Design Name: 
-- Module Name: ThermoBitCounter - Behavioral
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

entity ThermoBitCounter is

    Port ( 
        thermo_block_in : in STD_LOGIC_VECTOR(3 downto 0);
        thermo_block_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    
end ThermoBitCounter;

architecture Behavioral of ThermoBitCounter is

begin
    thermo_block_out(3) <= '0';
    thermo_block_out(2) <= thermo_block_in(2);
    thermo_block_out(1) <= thermo_block_in(1) AND (NOT thermo_block_in(3)); -- CA'
    thermo_block_out(0) <= (NOT thermo_block_in(1)) OR ( (NOT thermo_block_in(3)) AND thermo_block_in(2) ); -- C' + A'B

end Behavioral;
