----------------------------------------------------------------------------------
--Company: UNAD
-- Engineer: Juan León
-- 
-- Create Date:    23:15:33 11/30/2018 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detector_flanco is -- DETECTOR DE FLANCO
    Port ( D0 : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q0 : out  STD_LOGIC);
end detector_flanco;

architecture Behavioral of detector_flanco is

signal Q_bus, D_bus : STD_LOGIC;
begin

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

D_bus <= D0;
Q0 <= D_bus and (not Q_bus); -- DETECTOR DE FLANCO

end Behavioral;
