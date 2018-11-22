----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer:  Juan León
-- Create Date:    14:46:58 10/28/2018 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity flipflopD is
    Port ( entrada : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           enable : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           salida : out  STD_LOGIC);
end flipflopD;

architecture Behavioral of flipflopD is
signal Q_bus, D_bus : STD_LOGIC;
begin
	process (clk)
begin
   if clk'event and clk ='1' then  -- Detector de flanco.
      if  reset = '1' then   
         Q_bus <= '0';     
      elsif enable ='1' then       -- Habilita el cambio, enable.
         Q_bus <= D_bus;
      end if;
   end if;
end process;
 D_bus <= entrada;
 
 salida <= Q_bus;

end Behavioral;

