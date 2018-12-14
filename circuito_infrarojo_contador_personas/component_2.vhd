

----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan León

----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Component_2 is
    Port ( CLK1 : in  STD_LOGIC;
           ENABLE1 : in  STD_LOGIC;
           RESET1 : in  STD_LOGIC;
			  COMPARADOR : out STD_LOGIC;
           Q1 : out  STD_LOGIC_VECTOR (3 downto 0));
end Component_2;

architecture Behavioral of Component_2 is
signal Q_bus1, D_bus1 : STD_LOGIC_VECTOR(3 downto 0);
signal comp_bus : STD_LOGIC;  

begin
	
process (CLK1)
begin
   if CLK1'event and CLK1='1' then  
      if RESET1 ='1' then   
          Q_bus1 <= (others => '0');
      elsif ENABLE1 = '1' then
        Q_bus1 <= D_bus1;
      end if;
   end if;
end process;
	  
	
    comp_bus <= '1' when Q_bus1 = "1001" else
			      '0';
			
    D_bus1 <= "0000" when comp_bus = '1' else
              Q_bus1 + 1 ;
			  
		
			
Q1 <= Q_bus1;

COMPARADOR <= comp_bus;

end Behavioral;
