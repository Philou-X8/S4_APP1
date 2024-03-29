---------------------------------------------------------------------------------------------
-- Universit� de Sherbrooke - D�partement de GEGI
-- Version         : 3.0
-- Nomenclature    : GRAMS
-- Date            : 21 Avril 2020
-- Auteur(s)       : R�jean Fontaine, Daniel Dalle, Marc-Andr� T�trault
-- Technologies    : FPGA Zynq (carte ZYBO Z7-10 ZYBO Z7-20)
--                   peripheriques: Pmod8LD PmodSSD
--
-- Outils          : vivado 2019.1 64 bits
---------------------------------------------------------------------------------------------
-- Description:
-- Circuit utilitaire pour le laboratoire et la probl�matique de logique combinatoire
--
---------------------------------------------------------------------------------------------
-- � faire :
-- Voir le guide de l'APP
--    Ins�rer les modules additionneurs ("components" et "instances")
--
---------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity AppCombi_top is
  port ( 
          i_btn       : in    std_logic_vector (3 downto 0); -- Boutons de la carte Zybo
          i_sw        : in    std_logic_vector (3 downto 0); -- Interrupteurs de la carte Zybo
          sysclk      : in    std_logic;                     -- horloge systeme
          
          i_S1        : in    std_logic;                     -- Bouton S1
          i_S2        : in    std_logic;                     -- Bouton S2
          i_ADCth     : in    std_logic_vector (11 downto 0);-- 12 bit Thermometrique
          
          o_SSD       : out   std_logic_vector (7 downto 0); -- vers cnnecteur pmod afficheur 7 segments
          o_led       : out   std_logic_vector (3 downto 0); -- vers DELs de la carte Zybo
          o_led6_r    : out   std_logic;                     -- vers DEL rouge de la carte Zybo
          o_pmodled   : out   std_logic_vector (7 downto 0)  -- vers connecteur pmod 8 DELs
          );
end AppCombi_top;
 
architecture BEHAVIORAL of AppCombi_top is

   constant nbreboutons     : integer := 4;    -- Carte Zybo Z7
   constant freq_sys_MHz    : integer := 125;  -- 125 MHz 
   
   signal d_s_1Hz           : std_logic;
   signal clk_5MHz          : std_logic;
   --
   signal d_opa             : std_logic_vector (3 downto 0):= "0000";   -- operande A
   signal d_opb             : std_logic_vector (3 downto 0):= "0000";   -- operande B
   signal d_cin             : std_logic := '0';                         -- retenue entree
   signal d_sum             : std_logic_vector (3 downto 0):= "0000";   -- somme
   signal d_cout            : std_logic := '0';                         -- retenue sortie
   --
   signal d_AFF0            : std_logic_vector (3 downto 0):= "0000";
   signal d_AFF1            : std_logic_vector (3 downto 0):= "0000";
   
   
   signal d_ADCbin          : std_logic_vector (3 downto 0):= "0000";   -- Thermo converti en 4 bits
   signal d_error           : std_logic := '0';                         -- Thermo erreur de conversion
 
   
 component synchro_module_v2 is
   generic (const_CLK_syst_MHz: integer := freq_sys_MHz);
      Port ( 
           clkm        : in  STD_LOGIC;  -- Entr�e  horloge maitre
           o_CLK_5MHz  : out STD_LOGIC;  -- horloge divise utilise pour le circuit             
           o_S_1Hz     : out  STD_LOGIC  -- Signal temoin 1 Hz
            );
      end component;  

   component septSegments_Top is
    Port (   clk          : in   STD_LOGIC;                      -- horloge systeme, typique 100 MHz (preciser par le constante)
             i_AFF0       : in   STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 8 bits : chiffre hexa position 1 et 0
             i_AFF1       : in   STD_LOGIC_VECTOR (3 downto 0);  -- donnee a afficher sur 8 bits : chiffre hexa position 1 et 0     
             o_AFFSSD_Sim : out string(1 to 2);
             o_AFFSSD     : out  STD_LOGIC_VECTOR (7 downto 0)  
           );
   end component;
   
    -- THERMO TO BINARY --
    component Thermo2Bin 
        port (
            adc12_vect : in std_logic_vector(11 downto 0);
            adc4_vect : out STD_LOGIC_VECTOR(3 downto 0);
            err_b : out std_logic
        );
    end component;
    
    -- LED ARRAY --
    component Fct2_3 
        port (
            ADCbin_in : in STD_LOGIC_VECTOR(3 downto 0);
            A2_3_out : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;
    component Decodeur3_8 
        port (
            A2_3_in : in std_logic_vector(2 downto 0);
            LED_vect_out : out std_logic_vector(7 downto 0)
        );
    end component;
    signal A2_3 : std_logic_vector(2 downto 0) := "000";
    
    -- PARITE --
    component Parite 
        port (
            ADCbin : in std_logic_vector(3 downto 0);
            S1 : in STD_LOGIC; -- 1 pour impaire, 0 pour paire
            Parite_out : out STD_LOGIC
        );
    end component;
    
    -- 7 SEGMENT LED ENCODING --
    component MUX is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : in STD_LOGIC;
           BTN : in STD_LOGIC_VECTOR (1 downto 0);
           S2 : in STD_LOGIC;
           DAFF0 : out STD_LOGIC_VECTOR (3 downto 0);
           DAFF1 : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

begin
    
    inst_synch : synchro_module_v2
    generic map (const_CLK_syst_MHz => freq_sys_MHz)
        port map (
            clkm         => sysclk,
            o_CLK_5MHz   => clk_5MHz,
            o_S_1Hz      => d_S_1Hz
        );  

    inst_aff :  septSegments_Top 
       port map (
           clk    => clk_5MHz,
           -- donnee a afficher definies sur 8 bits : chiffre hexa position 1 et 0
           i_AFF1  => d_AFF1, 
           i_AFF0  => d_AFF0,
           o_AFFSSD_Sim   => open,   -- ne pas modifier le "open". Ligne pour simulations seulement.
           o_AFFSSD       => o_SSD   -- sorties directement adaptees au connecteur PmodSSD
       );
   
    -- Lecture Thermo2Bin
    thermo12_4bit : Thermo2Bin
    port map(
        adc12_vect => i_ADCth,
        adc4_vect => d_ADCbin,
        err_b => d_error
    );
    -- Lecture Thermo2Bin -- FIN
    
    -- Array 8 leds
    LED_arr_fact : Fct2_3
    port map(
        ADCbin_in => d_ADCbin,
        A2_3_out => A2_3
    );
    
    LED_arr_decode : Decodeur3_8
    port map(
        A2_3_in => A2_3,
        LED_vect_out => o_pmodled
    );
    -- Array 8 leds -- FIN
    
    -- test Parite 
    LED_parite : Parite
    port map(
        ADCbin => d_ADCbin,
        S1 => i_S1,
        Parite_out => o_led(0)
    );
    -- TODO: Add the DEL2 of the thermometric card
    -- test Parite -- FIN
    
    -- ultiplexeur
    SEG_encode : MUX PORT MAP (
           ADCbin => d_ADCbin,
           erreur => d_error,
           BTN => i_btn(1 downto 0),
           S2 => i_s2,
           DAFF0 => d_AFF0,
           DAFF1 => d_AFF1
           );
    -- ultiplexeur -- FIN
    
    -- AUTRE
    d_opa               <=  i_sw;                        -- operande A sur interrupteurs
    d_opb               <=  i_btn;                       -- operande B sur boutons
    d_cin               <=  '0';                     -- la retenue d'entr�e alterne 0 1 a 1 Hz
       
    --d_AFF0              <=  d_sum(3 downto 0);           -- Le resultat de votre additionneur affich� sur PmodSSD(0)
    --d_AFF1              <=  '0' & '0' & '0' & d_Cout;    -- La retenue de sortie affich�e sur PmodSSD(1) (0 ou 1)
    --o_led6_r            <=  d_Cout;                      -- La led couleur repr�sente aussi la retenue en sortie  Cout
    --o_pmodled           <=  d_opa & d_opb;               -- Les op�randes d'entr�s reproduits combin�s sur Pmod8LD
    --o_led (3 downto 0)  <=  '0' & '0' & '0' & d_S_1Hz;   -- La LED0 sur la carte repr�sente la retenue d'entr�e        
    
    
end BEHAVIORAL;


