
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY sim_ContadorDescendente IS
END sim_ContadorDescendente;
 
ARCHITECTURE behavior OF sim_ContadorDescendente IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Contador_Descendente
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         salida : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Contador_Descendente PORT MAP (
          clk => clk,
          reset => reset,
          salida => salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '1';
		wait for 100 ns;	
		reset <= '0';
		wait for 100 ns;
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
