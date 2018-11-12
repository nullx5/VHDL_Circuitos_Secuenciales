-- Company: UNAD
-- Engineer: Juan León
-- Create Date:    11:07:21 11/12/2018 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
entity Contador_AscendenteDescendente is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  Selector: in STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (4 downto 0));
end Contador_AscendenteDescendente;
architecture Behavioral of Contador_AscendenteDescendente is
signal D, Q, s1, s2 :STD_LOGIC_VECTOR(4 downto 0);
begin
	  
process (clk)
begin
			
   if clk'event and clk='1' then  
      if reset ='1' then   
         Q <= (others => '0'); -- Otra forma de hacerlo, pra varias bits
      else
         Q <= D;
      end if;
   end if;		
end process;
   s1 <= "00000" when Q = 30 else
			Q + '1';
	
   s2 <= "11110" when Q = 0 else
			Q - '1';
			
	with Selector select
      D <=  s1 when '0',
				s2	when others;
salida <= Q;
end Behavioral;

   
			
   