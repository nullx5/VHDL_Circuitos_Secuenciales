----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan León
-- 
-- Create Date:    23:27:00 11/30/2018 

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Top is
    Port ( CLK_g : in  STD_LOGIC;
           Dato_Valido : in  STD_LOGIC;
           Dato_Entrada : in  STD_LOGIC_VECTOR (31 downto 0);
           Dato_Salida : out  STD_LOGIC_VECTOR (31 downto 0);
           reset_g : in  STD_LOGIC);
end Top;

architecture Behavioral of Top is

COMPONENT detector_flanco
	PORT(
		D0 : IN std_logic;
		CLK : IN std_logic;
		RESET : IN std_logic;          
		Q0 : OUT std_logic
		);
	END COMPONENT;

COMPONENT contador
	PORT(
		CLK2 : IN std_logic;
		ENABLE2 : IN std_logic;
		RESET2 : IN std_logic;          
		Q2 : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
COMPONENT RAM
	PORT(
		Data_IN : IN std_logic_vector(31 downto 0);
		Address : IN std_logic_vector(15 downto 0);
		W_EN : IN std_logic;
		CLK : IN std_logic;          
		DATA_OUT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;




signal s1: STD_LOGIC_VECTOR(15 downto 0);
signal s2: STD_LOGIC; 
begin

	Inst_detector_flanco: detector_flanco PORT MAP(
		D0 => Dato_Valido,
		CLK => CLK_g ,
		RESET => reset_g ,
		Q0 => s2
	);


	Inst_contador: contador PORT MAP(
		CLK2 => CLK_g,
		ENABLE2 => s2 ,
		RESET2 => reset_g,
		Q2 => s1
	);


	Inst_RAM: RAM PORT MAP(
		Data_IN => Dato_Entrada ,
		Address => s1,
		W_EN => s2,
		DATA_OUT => Dato_Salida,
		CLK => CLK_G
	);



end Behavioral;

