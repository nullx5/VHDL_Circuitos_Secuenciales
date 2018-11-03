----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer:  Juan León
-- Create Date:    14:46:58 10/28/2018 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity flipflopD is
    Port ( D : in  STD_LOGIC_VECTOR(15 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR(15 downto 0));
end flipflopD;

architecture Behavioral of flipflopD is

begin
	process (clk)
begin
   if clk'event and clk ='1' then  -- Detector de flanco.
      if  reset = '1' then   
         Q <= "0000000000000000";     
      elsif enable ='1' then       -- Habilita el cambio, enable.
         Q <= D;
      end if;
   end if;
end process;
 

end Behavioral;

