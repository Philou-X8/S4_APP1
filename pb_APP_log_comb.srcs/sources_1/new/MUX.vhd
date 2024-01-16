----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 05:53:57 PM
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX is
    Port ( ADCbin : in STD_LOGIC_VECTOR (3 downto 0);
           erreur : in STD_LOGIC;
           BTN : in STD_LOGIC_VECTOR (1 downto 0);
           S2 : in STD_LOGIC;
           DAFF0 : out STD_LOGIC_VECTOR (3 downto 0);
           DAFF1 : out STD_LOGIC_VECTOR (3 downto 0));
    end MUX;

architecture Behavioral of MUX is

component Bin2DualBCD is
    Port ( ADCBin : in STD_LOGIC_VECTOR (3 downto 0);
           Dizaines : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_ns : out STD_LOGIC_VECTOR (3 downto 0);
           Code_signe : out STD_LOGIC_VECTOR (3 downto 0);
           Unites_s : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal Dizaines_sim : STD_LOGIC_VECTOR (3 downto 0);
signal Unites_ns_sim : STD_LOGIC_VECTOR (3 downto 0);
signal Code_signe_sim : std_logic_vector (3 downto 0);
signal Unites_s_sim : std_logic_vector (3 downto 0);

begin
    
    inst_MUX : Bin2DualBCD
        port map (
            ADCBin => ADCBin,
            Dizaines => Dizaines_sim,
            Unites_ns => Unites_ns_sim,
            Code_signe => Code_signe_sim,
            Unites_s => Unites_s_sim
            );
        
    process(ADCBin, Dizaines_sim, Unites_ns_sim, Code_signe_sim, Unites_s_sim, BTN, S2)
    BEGIN
        
        -- BTN0 non-presse et BTN1 non-presse
        if (BTN(0) = '0') AND (BTN(1) = '0') then
            DAFF0 <= Dizaines_sim;
            DAFF1 <= Unites_ns_sim;
         end if;
         
        -- BTN0 presse
        if (BTN(0) = '1') AND (BTN(1) = '0') then
            DAFF0 <= "0000";
            DAFF1 <= ADCBin;
         end if;
         
         --BTN1 presse
         if (BTN(1) = '1') AND (BTN(0) = '0') then
            DAFF0 <= Code_signe_sim;
            DAFF1 <= Unites_s_sim;
          end if;
         
        -- BTN0 presse et BTN1 presse
        if (BTN(0) = '1') AND (BTN(1) = '1') then
            DAFF0 <= "1110";
            DAFF1 <= "1101";
         end if;
         
        --S2 est presse
        if (s2 = '1') then
            DAFF0 <= "1110";
            DAFF1 <= "1101";
         end if;         
         
        if (erreur = '1') then
            DAFF0 <= "1110";
            DAFF1 <= "1101";
        end if;
            
         
    end process;
end Behavioral;
