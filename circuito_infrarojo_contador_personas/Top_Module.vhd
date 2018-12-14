

----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan León
-- 
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
		CLK1 : IN std_logic;
		ENABLE1 : IN std_logic;
		RESET1 : IN std_logic;          
		COMPARADOR : OUT std_logic;
		Q1 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT Component_3
	PORT(
		CLK2 : IN std_logic;
		ENABLE2 : IN std_logic;
		RESET2 : IN std_logic;          
		Q2 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT Component_4
	PORT(
		D1 : IN std_logic;
		CLK3 : IN std_logic;
		RESET3 : IN std_logic;          
		Q3 : OUT std_logic
		);
	END COMPONENT;

	
signal s1, s2, s3 :STD_LOGIC;
begin
	
Inst_Component_1: Component_1 PORT MAP(
		D0 =>  Entrada_Infrarojo,
		CLK => clk_g,
		RESET => reset_g,
		Q0 => s1
	);
	
	
Inst_Component_2: Component_2 PORT MAP(
		CLK1 => clk_g,
		ENABLE1 => s1,
		RESET1 => reset_g,
		COMPARADOR => s2,
		Q1 => Unidades
	);

	Inst_Component_3: Component_3 PORT MAP(
		CLK2 => clk_g,
		ENABLE2 => s3,
		RESET2 => reset_g,
		Q2 => Decenas
	);

Inst_Component_4: Component_4 PORT MAP(
		D1 => s2,
		CLK3 => clk_g,
		RESET3 => reset_g ,
		Q3 => s3
	);

end Behavioral;

