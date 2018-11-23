----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan León
-- Create Date:    19:25:21 11/22/2018 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Top_Module is
    Port ( Entrada_Infrarojo : in  STD_LOGIC;
			  clk_g: in STD_LOGIC;
			  reset_g: in STD_LOGIC;
           Unidades : out  STD_LOGIC_VECTOR (3 downto 0);
           Decenas : out  STD_LOGIC_VECTOR (3 downto 0));
end Top_Module;

architecture Behavioral of Top_Module is

	COMPONENT Component_1
	PORT(
		D0 : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		Q0 : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT Component_2
	PORT(
		CLK : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;   
		COMPARADOR : out STD_LOGIC;
		Q1 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Component_3
	PORT(
		CLK : IN std_logic;
		ENABLE : IN std_logic;
		RESET : IN std_logic;          
		Q2 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	
signal s1, s2 :STD_LOGIC;
begin
	
Inst_Component_1: Component_1 PORT MAP(
		D0 =>  Entrada_Infrarojo,
		CLK => clk_g,
		RESET => reset_g,
		Q0 => s1
	);
	
	
Inst_Component_2: Component_2 PORT MAP(
		CLK => clk_g,
		ENABLE => s1,
		RESET => reset_g,
		COMPARADOR => s2,
		Q1 => Unidades
	);

	Inst_Component_3: Component_3 PORT MAP(
		CLK => clk_g,
		ENABLE => s2,
		RESET => reset_g,
		Q2 => Decenas
	);



end Behavioral;

