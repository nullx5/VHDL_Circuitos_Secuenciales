-- Company: UNAD
-- Engineer: Juan León
-- Create Date:    18:39:30 11/10/2018 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registro_8Bits is
    Port ( clk : in  STD_LOGIC;
           entrada : in  STD_LOGIC_VECTOR (7 downto 0);
           enable : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida : out  STD_LOGIC_VECTOR (7 downto 0));
end registro_8Bits;

architecture Behavioral of registro_8Bits is

signal Q_bus, D_bus :  STD_LOGIC_VECTOR(7 downto 0);
begin
    
process (clk)
begin
   if clk'event and clk>='1' then  
      if reset='1' then   
         Q_bus <= (others => '0'); -- Otra forma de hacerlo, se podría colocar los 8 bits
      elsif enable ='1' then
         Q_bus <= D_bus;
      end if;
   end if;
end process;

D_bus <= entrada;
salida <= Q_bus;
 

end Behavioral;

