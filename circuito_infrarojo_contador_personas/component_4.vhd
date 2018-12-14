
----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan León
------------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;





entity Component_4 is -- DETECTOR DE FLANCO
    Port ( D1 : in  STD_LOGIC;
           CLK3 : in  STD_LOGIC;
           RESET3 : in  STD_LOGIC;
           Q3 : out  STD_LOGIC);
end Component_4;

architecture Behavioral of Component_4 is

signal Q_bus3, D_bus3 : STD_LOGIC;
begin

	process (CLK3)
begin
   if CLK3'event and CLK3 ='1' then  -- Detector de flanco.
      if  RESET3 = '1' then   
         Q_bus3 <= '0';     
      else
         Q_bus3 <= D_bus3;
      end if;
   end if;
end process;

D_bus3 <= D1;
Q3 <= (not D_bus3) and Q_bus3; -- DETECTOR DE FLANCO

end Behavioral;