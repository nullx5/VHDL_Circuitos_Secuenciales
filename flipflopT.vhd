----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan León
-- Create Date:    20:07:16 11/02/2018 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity flipflopT is
    Port ( 
           CLK : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           T : in  STD_LOGIC;
			  Q : out  STD_LOGIC);
end flipflopT;
architecture Behavioral of flipflopT is

signal T_bus, Q_bus : STD_LOGIC:='0'; --Importante Inicializar a cero.
begin
	process (CLK, reset, enable)   -- 
begin
	if reset='1' then   
         Q_bus <= '0';
		   elsif CLK'event and CLK='1' and enable = '1' then
         Q_bus <=  T_bus;
			
      end if;	
end process;

	 with T select   --Logíca del estado siguiente.
      T_bus <= Q_bus when '0',
                not 	(Q_bus) when others;
					 --Logica de salida
Q <= Q_bus;

end Behavioral;

