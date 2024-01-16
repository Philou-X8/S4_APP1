----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 07:55:05 PM
-- Design Name: 
-- Module Name: Bin2DualBCD_tb - Behavioral
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

entity Bin2DualBCD_tb is
end Bin2DualBCD_tb;

architecture Behavioral of Bin2DualBCD_tb is

component Bin2DualBCD is
    Port ( ADCBin : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_s : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal ADCBin_sim : STD_LOGIC_VECTOR (3 downto 0);
signal Dizaines_sim : STD_LOGIC_VECTOR (3 downto 0);
signal Unites_ns_sim : STD_LOGIC_VECTOR (3 downto 0); 
signal Code_signe_sim : STD_LOGIC_VECTOR (3 downto 0);
signal Unites_s_sim : STD_LOGIC_VECTOR (3 downto 0);

    CONSTANT PERIOD    : time := 10 ns;

begin

    UUT : Bin2DualBCD PORT MAP (
        ADCBin => ADCBin_sim,
        Dizaines => Dizaines_sim,
        Unites_ns => Unites_ns_sim,
        Code_signe => Code_signe_sim,
        Unites_s => Unites_s_sim
        );
    
    tb : PROCESS
    BEGIN
    
       wait for PERIOD; ADCbin_sim <= "0000";
       wait for PERIOD; ADCbin_sim <= "0001";
       wait for PERIOD; ADCbin_sim <= "0010";
       wait for PERIOD; ADCbin_sim <= "0011";
       wait for PERIOD; ADCbin_sim <= "0100";
       wait for PERIOD; ADCbin_sim <= "0101";
       wait for PERIOD; ADCbin_sim <= "0110";
       wait for PERIOD; ADCbin_sim <= "0111";
       wait for PERIOD; ADCbin_sim <= "1000";
       wait for PERIOD; ADCbin_sim <= "1001";
       wait for PERIOD; ADCbin_sim <= "1010";
       wait for PERIOD; ADCbin_sim <= "1011";
       wait for PERIOD; ADCbin_sim <= "1100";
       wait;
   END PROCESS;
END;

