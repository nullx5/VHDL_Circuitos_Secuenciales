----------------------------------------------------------------------------------
--Company: UNAD
-- Engineer: Juan León
-- 
-- Create Date:    23:13:14 11/30/2018 
-------------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity RAM is
    Port ( Data_IN : in STD_LOGIC_VECTOR (31 downto 0);
           Address : in  STD_LOGIC_VECTOR (15 downto 0);
           W_EN : in  STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC);
end RAM;

architecture Behavioral of RAM is

type t_matriz is array (15 downto 0) of STD_LOGIC_VECTOR (31 downto 0);
signal RAM : t_matriz;

begin

process (CLK)
begin
   if CLK'event and CLK='1' then  
      if (W_EN )='1' then   
			RAM(conv_integer(Address)) <= Data_IN;
      end if;
   end if;
end process;
 
 DATA_OUT <= RAM(conv_integer(Address));

end Behavioral;
