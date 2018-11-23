

----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan León
-- Create Date:    18:04:47 11/22/2018 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Component_1 is
    Port ( D0 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q0 : out  STD_LOGIC);
end Component_1;

architecture Behavioral of Component_1 is

signal Q_bus, D_bus : STD_LOGIC;
begin


D_bus <= D0;	

	process (CLK)
begin
   if CLK'event and CLK ='1' then  -- Detector de flanco.
      if  RESET = '1' then   
         Q_bus <= '0';     
      else     
         Q_bus <= D_bus;
      end if;
   end if;
end process;

 
Q0 <= D_bus and (not Q_bus);

end Behavioral;

