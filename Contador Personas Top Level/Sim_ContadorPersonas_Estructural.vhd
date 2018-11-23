
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY Sim_ContadorPersonas_Estructural IS
END Sim_ContadorPersonas_Estructural;
 
ARCHITECTURE Structural OF Sim_ContadorPersonas_Estructural IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top_Module
    PORT(
         Entrada_Infrarojo : IN  std_logic;
         clk_g : IN  std_logic;
         reset_g : IN  std_logic;
         Unidades : OUT  std_logic_vector(3 downto 0);
         Decenas : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Entrada_Infrarojo : std_logic := '0';
   signal clk_g : std_logic := '0';
   signal reset_g : std_logic := '0';

 	--Outputs
   signal Unidades : std_logic_vector(3 downto 0);
   signal Decenas : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_g_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top_Module PORT MAP (
          Entrada_Infrarojo => Entrada_Infrarojo,
          clk_g => clk_g,
          reset_g => reset_g,
          Unidades => Unidades,
          Decenas => Decenas
        );

   -- Clock process definitions
   clk_g_process :process
   begin
		clk_g <= '0';
		wait for clk_g_period/2;
		clk_g <= '1';
		wait for clk_g_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      
		reset <= '1';           
		wait for 100 ns;
		reset <= '0';           -- puesta a cero 
      wait for 100 ns;
		Entrada_Infrarojo <= '1';
		wait for 400 ns;
		Entrada_Infrarojo <= '1';
		wait for 500 ns;
		Entrada_Infrarojo <= '0';
		wait for 400 ns;
		Entrada_Infrarojo <= '1';
		wait for 800 ns;
		Entrada_Infrarojo <= '0';
		wait for 300 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
