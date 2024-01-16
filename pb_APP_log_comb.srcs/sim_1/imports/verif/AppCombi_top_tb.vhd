---------------------------------------------------------------------------------------------
-- labo_adder4b_sol_tb.vhd
---------------------------------------------------------------------------------------------
-- Université de Sherbrooke - Département de GEGI
-- Version         : 3.0
-- Nomenclature    : GRAMS
-- Date Révision   : 21 Avril 2020
-- Auteur(s)       : Réjean Fontaine, Daniel Dalle, Marc-André Tétrault
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: carte Thermo12, Pmod8LD PmodSSD
--
-- Outils          : vivado 2019.1 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Banc d'essai pour circuit combinatoire Laboratoire logique combinatoire
-- Version avec entrées toutes combinatoires CIRCUIT COMPLET (TOP)
-- 
-- Revision v1 12 novembre 2018, 3 décembre 2018 D. Dalle 
-- Revision 30 Avril 2021, M-A Tetrault
--
---------------------------------------------------------------------------------------------
-- Notes :
-- L'entrée retenue (i_cin) est générée par l'interrupteur S1 de la carte Thermobin
--
---------------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- requis pour enoncés de type mem_valeurs_tests(to_integer( unsigned(table_valeurs_adr(9 downto 6) )));
USE ieee.numeric_std.ALL;          -- 
use IEEE.STD_LOGIC_UNSIGNED.ALL;   --


entity AppCombi_top_tb is
--  Port ( );
end AppCombi_top_tb;

architecture Behavioral of AppCombi_top_tb is

COMPONENT verif_show_affhex is
end COMPONENT;

COMPONENT AppCombi_top
   port ( 
     i_btn       : in    std_logic_vector (3 downto 0); 
     i_sw        : in    std_logic_vector (3 downto 0); 
     sysclk      : in    std_logic; 
     
          i_S1        : in    std_logic;                     -- Bouton S1
          i_S2        : in    std_logic;                     -- Bouton S2
          i_ADCth     : in    std_logic_vector (11 downto 0);-- 12 bit Thermometrique
          
     o_SSD       : out   std_logic_vector (7 downto 0); 
     o_led       : out   std_logic_vector (3 downto 0); 
     o_led6_r    : out   std_logic;        
     o_pmodled   : out   std_logic_vector (7 downto 0) 
     );    
end COMPONENT;

   signal clk_sim       :  STD_LOGIC := '0';
   signal pmodled_sim   :  STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
   signal led_sim       :  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
   signal led6_r_sim    :  STD_LOGIC := '0';
   signal SSD_sim       :  STD_LOGIC_VECTOR (7 DOWNTO 0) := "00000000";
   signal sw_sim        :  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
   signal btn_sim       :  STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
   signal cin_sim       :  STD_LOGIC := '0';
   signal vecteur_test_sim   :  STD_LOGIC_VECTOR (13 DOWNTO 0) := (others => '0');
   signal resultat_attendu       :  STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000";
   
   signal S1_sim    :  STD_LOGIC := '0';
   signal S2_sim    :  STD_LOGIC := '0';
   signal ADC_sim       :  STD_LOGIC_VECTOR (11 DOWNTO 0) := "000000000000";


   constant sysclk_Period  : time := 8 ns;
   
   CONSTANT PERIOD    : time := 10 ns;


----------------------------------------------------------------------------
-- declaration d'un tableau pour soumettre un vecteur de test  
----------------------------------------------------------------------------  
 type table_valeurs_tests is array (integer range 0 to 63) of std_logic_vector(13 downto 0);
    constant mem_valeurs_tests : table_valeurs_tests := 
    ( 
  --  vecteur de test è modifier selon les besoins
  --  res      op_a     op_b    cin
    "00000" & "0000" & "0000" & '0',  --   0 +  0  
    "00000" & "0000" & "0001" & '0',  --   0 +  1 
    -- modifez et/ou ajoutez vos valeurs
  
    -- conserver la ligne ci-bas.
    others => "00000" & "0000" & "0000" & '0'  --  0 + 0 
    );
----------------------------------------------------------------------------

begin


-- Pattes du FPGA Zybo-Z7
uut: AppCombi_top
   PORT MAP(
   i_btn       =>   btn_sim,
   i_sw        =>   sw_sim,
   sysclk      =>   clk_sim,
   i_S1        =>   S1_sim,
   i_S2        =>   S2_sim,
   i_ADCth     =>   ADC_sim,
   o_SSD       =>   SSD_sim,
   o_led       =>   led_sim,
   o_pmodled   =>   pmodled_sim,
   o_led6_r    =>   led6_r_sim
   );
   
   

	-- Section banc de test
    ----------------------------------------
	-- generation horloge 
	----------------------------------------
   process
   begin
       clk_sim <= '1';  -- init
       loop
           wait for sysclk_Period/2;
           clk_sim <= not clk_sim;    -- invert clock value
       end loop;
   end process;  
	----------------------------------------
   
   ----------------------------------------
   -- test bench
    tb : PROCESS
    BEGIN
        -- test 1 -- BCD non signe
        BTN_sim <= "0000"; 
        ADC_sim <= "000000000000"; wait for PERIOD;
        ADC_sim <= "000000000001"; wait for PERIOD;
        ADC_sim <= "000000000011"; wait for PERIOD;
        ADC_sim <= "000000000111"; wait for PERIOD;
        ADC_sim <= "000000001111"; wait for PERIOD;
        ADC_sim <= "000000011111"; wait for PERIOD;
        ADC_sim <= "000000111111"; wait for PERIOD;
        ADC_sim <= "000001111111"; wait for PERIOD;
        ADC_sim <= "000011111111"; wait for PERIOD;
        ADC_sim <= "000111111111"; wait for PERIOD;
        ADC_sim <= "001111111111"; wait for PERIOD;
        ADC_sim <= "011111111111"; wait for PERIOD;
        ADC_sim <= "111111111111"; wait for PERIOD;
        
        
        -- test 2 -- HEX
        BTN_sim <= "0001"; 
        ADC_sim <= "000000000000"; wait for PERIOD;
        ADC_sim <= "000000000001"; wait for PERIOD;
        ADC_sim <= "000000000011"; wait for PERIOD;
        ADC_sim <= "000000000111"; wait for PERIOD;
        ADC_sim <= "000000001111"; wait for PERIOD;
        ADC_sim <= "000000011111"; wait for PERIOD;
        ADC_sim <= "000000111111"; wait for PERIOD;
        ADC_sim <= "000001111111"; wait for PERIOD;
        ADC_sim <= "000011111111"; wait for PERIOD;
        ADC_sim <= "000111111111"; wait for PERIOD;
        ADC_sim <= "001111111111"; wait for PERIOD;
        ADC_sim <= "011111111111"; wait for PERIOD;
        ADC_sim <= "111111111111"; wait for PERIOD;
        
        -- test 3 -- BCD signe -5
        BTN_sim <= "0010"; 
        ADC_sim <= "000000000000"; wait for PERIOD;
        ADC_sim <= "000000000001"; wait for PERIOD;
        ADC_sim <= "000000000011"; wait for PERIOD;
        ADC_sim <= "000000000111"; wait for PERIOD;
        ADC_sim <= "000000001111"; wait for PERIOD;
        ADC_sim <= "000000011111"; wait for PERIOD;
        ADC_sim <= "000000111111"; wait for PERIOD;
        ADC_sim <= "000001111111"; wait for PERIOD;
        ADC_sim <= "000011111111"; wait for PERIOD;
        ADC_sim <= "000111111111"; wait for PERIOD;
        ADC_sim <= "001111111111"; wait for PERIOD;
        ADC_sim <= "011111111111"; wait for PERIOD;
        ADC_sim <= "111111111111"; wait for PERIOD;
        
        -- test 4 -- LED arr 
        BTN_sim <= "0000"; 
        ADC_sim <= "000000000000"; wait for PERIOD;
        ADC_sim <= "000000000001"; wait for PERIOD;
        ADC_sim <= "000000000011"; wait for PERIOD;
        ADC_sim <= "000000000111"; wait for PERIOD;
        ADC_sim <= "000000001111"; wait for PERIOD;
        ADC_sim <= "000000011111"; wait for PERIOD;
        ADC_sim <= "000000111111"; wait for PERIOD;
        ADC_sim <= "000001111111"; wait for PERIOD;
        ADC_sim <= "000011111111"; wait for PERIOD;
        ADC_sim <= "000111111111"; wait for PERIOD;
        ADC_sim <= "001111111111"; wait for PERIOD;
        ADC_sim <= "011111111111"; wait for PERIOD;
        ADC_sim <= "111111111111"; wait for PERIOD;
        
        -- test 5 -- Parite impaire
        S1_sim <= '1'; 
        ADC_sim <= "000000000000"; wait for PERIOD;
        ADC_sim <= "000000000001"; wait for PERIOD;
        ADC_sim <= "000000000011"; wait for PERIOD;
        ADC_sim <= "000000000111"; wait for PERIOD;
        ADC_sim <= "000000001111"; wait for PERIOD;
        ADC_sim <= "000000011111"; wait for PERIOD;
        ADC_sim <= "000000111111"; wait for PERIOD;
        ADC_sim <= "000001111111"; wait for PERIOD;
        ADC_sim <= "000011111111"; wait for PERIOD;
        ADC_sim <= "000111111111"; wait for PERIOD;
        ADC_sim <= "001111111111"; wait for PERIOD;
        ADC_sim <= "011111111111"; wait for PERIOD;
        ADC_sim <= "111111111111"; wait for PERIOD;
        
        -- test 6 -- Parite paire
        S1_sim <= '0'; 
        ADC_sim <= "000000000000"; wait for PERIOD;
        ADC_sim <= "000000000001"; wait for PERIOD;
        ADC_sim <= "000000000011"; wait for PERIOD;
        ADC_sim <= "000000000111"; wait for PERIOD;
        ADC_sim <= "000000001111"; wait for PERIOD;
        ADC_sim <= "000000011111"; wait for PERIOD;
        ADC_sim <= "000000111111"; wait for PERIOD;
        ADC_sim <= "000001111111"; wait for PERIOD;
        ADC_sim <= "000011111111"; wait for PERIOD;
        ADC_sim <= "000111111111"; wait for PERIOD;
        ADC_sim <= "001111111111"; wait for PERIOD;
        ADC_sim <= "011111111111"; wait for PERIOD;
        ADC_sim <= "111111111111"; wait for PERIOD;
        
        -- test 7 -- Err avec BTN{1,1}
        BTN_sim <= "0011"; 
        ADC_sim <= "000000000000"; wait for PERIOD;
        ADC_sim <= "000000000001"; wait for PERIOD;
        ADC_sim <= "000000000011"; wait for PERIOD;
        ADC_sim <= "000000000111"; wait for PERIOD;
        ADC_sim <= "000000001111"; wait for PERIOD;
        ADC_sim <= "000000011111"; wait for PERIOD;
        ADC_sim <= "000000111111"; wait for PERIOD;
        ADC_sim <= "000001111111"; wait for PERIOD;
        ADC_sim <= "000011111111"; wait for PERIOD;
        ADC_sim <= "000111111111"; wait for PERIOD;
        ADC_sim <= "001111111111"; wait for PERIOD;
        ADC_sim <= "011111111111"; wait for PERIOD;
        ADC_sim <= "111111111111"; wait for PERIOD;
        
        -- test 8 -- Err de formatage
        BTN_sim <= "0000"; 
        ADC_sim <= "000000000100"; wait for PERIOD;
        ADC_sim <= "000000010001"; wait for PERIOD;
        ADC_sim <= "110111111111"; wait for PERIOD;
        ADC_sim <= "111000000000"; wait for PERIOD;
        
        
    WAIT; -- will wait forever 
    END PROCESS;

END Behavioral;
