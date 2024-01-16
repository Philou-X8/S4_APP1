----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 06:56:43 PM
-- Design Name: 
-- Module Name: MUX_TestBench - Behavioral
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

entity MUX_tb is
end MUX_tb;

architecture Behavioral of MUX_tb is

    component MUX is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : in STD_LOGIC;
           BTN : in STD_LOGIC_VECTOR (1 downto 0);
           S2 : in STD_LOGIC;
           DAFF0 : out STD_LOGIC_VECTOR (3 downto 0);
           DAFF1 : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
      signal ADCbin_sim : STD_LOGIC_VECTOR (3 downto 0);
      signal erreur_sim : STD_LOGIC;
      signal BTN_sim : STD_LOGIC_VECTOR (1 downto 0);
      signal S2_sim : STD_LOGIC;
      signal DAFF0_sim : STD_LOGIC_VECTOR (3 downto 0);
      signal DAFF1_sim : STD_LOGIC_VECTOR (3 downto 0);  
      
    CONSTANT PERIOD    : time := 10 ns;
        
begin

    UUT : MUX PORT MAP (
           ADCbin => ADCBin_sim,
           erreur => erreur_sim,
           BTN => BTN_sim,
           S2 => s2_sim,
           DAFF0 => DAFF0_sim,
           DAFF1 => DAFF1_sim
           );
     tb : PROCESS
     BEGIN
     -- Test 1 -- base 10
       wait for PERIOD; BTN_sim <= "00"; 
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
       
       -- TEST 2 - HEX
       wait for PERIOD; BTN_sim <= "01"; 
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
       
       -- TEST 3 - negatif
       wait for PERIOD; BTN_sim <= "10"; 
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
       
       -- TEST 4 - Err
       wait for PERIOD; BTN_sim <= "11"; 
       wait for PERIOD; ADCbin_sim <= "0000";
       wait for PERIOD; ADCbin_sim <= "0001";
       wait for PERIOD; ADCbin_sim <= "0111";
       wait for PERIOD; ADCbin_sim <= "1000";
       wait for PERIOD; ADCbin_sim <= "1001";
       wait for PERIOD; ADCbin_sim <= "1010";
       wait for PERIOD; ADCbin_sim <= "1011";
       wait for PERIOD; ADCbin_sim <= "1100";
       
       -- TEST 5 - Err
       wait for PERIOD; s2_sim <= '1'; 
       wait for PERIOD; ADCbin_sim <= "0000";
       wait for PERIOD; ADCbin_sim <= "0001";
  
       wait;     
   END PROCESS;
       
END;
