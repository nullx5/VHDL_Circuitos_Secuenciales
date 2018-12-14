----------------------------------------------------------------------------------
-- Company: UNAD
-- Engineer: Juan Le�n


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity Component_3 is
    Port ( CLK2 : in  STD_LOGIC;
           ENABLE2 : in  STD_LOGIC;
           RESET2 : in  STD_LOGIC;
           Q2 : out  STD_LOGIC_VECTOR (3 downto 0));
end Component_3;

architecture Behavioral of Component_3 is

signal Q_bus2, D_bus2 : STD_LOGIC_VECTOR(3 downto 0);

begin
	
process (CLK2)
begin
   if CLK2'event and CLK2='1' then  
      if RESET2 ='1' then   
         Q_bus2 <= (others => '0');
      elsif ENABLE2 = '1' then
         Q_bus2 <= D_bus2;
      end if;
   end if;
end process;

 D_bus2 <= "0000" when Q_bus2 = "1001" else
         Q_bus2 + 1;

Q2 <= Q_bus2;

end Behavioral;

