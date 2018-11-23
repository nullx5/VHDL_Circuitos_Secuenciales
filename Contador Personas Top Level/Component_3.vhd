----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan León
-- Create Date:    19:04:54 11/22/2018 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Component_3 is
    Port ( CLK : in  STD_LOGIC;
           ENABLE : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           Q2 : out  STD_LOGIC_VECTOR (3 downto 0));
end Component_3;

architecture Behavioral of Component_3 is

signal Q_bus2, D_bus2 : STD_LOGIC_VECTOR(3 downto 0);

begin
	
process (CLK)
begin
   if CLK'event and CLK='1' then  
      if RESET ='1' then   
         Q_bus2 <= (others => '0');
      elsif ENABLE ='1' then
         Q_bus2 <= D_bus2;
      end if;
   end if;
end process;

 D_bus2 <= "0000" when Q_bus2 = "1001" else
         Q_bus2 + 1;

Q2 <= Q_bus2;

end Behavioral;

