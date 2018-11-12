-- Company: UNAD
-- Engineer:  Juan León
-- Create Date:    12:33:53 11/12/2018 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;


entity Contador_Descendente is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (4 downto 0));
end Contador_Descendente;

architecture Behavioral of Contador_Descendente is
signal Q, D: STD_LOGIC_VECTOR(4 downto 0);

begin
	
process (clk)
begin
   if clk'event and clk ='1' then  
      if reset ='1' then   
         Q <= (others => '0');
      else
         Q <= D;
      end if;
   end if;
end process;
	
   D <= "11110" when Q = 0  else
		  Q - '1';
			
salida <= Q;
end Behavioral;

