
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sim_flipflopD IS
END sim_flipflopD;
 
ARCHITECTURE behavior OF sim_flipflopD IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT flipflopD
    PORT(
         entrada : IN  std_logic;
         clk : IN  std_logic;
         enable : IN  std_logic;
         reset : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic := '0';
   signal clk : std_logic := '0';
   signal enable : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal salida : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: flipflopD PORT MAP (
          entrada => entrada,
          clk => clk,
          enable => enable,
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

      wait for clk_period*10;   
		reset <= '1';           -- reset al flipflop
		wait for clk_period*10;
		reset <= '0';           -- puesta a cero aal flipflop
		wait for clk_period*10;
		entrada <= '1';  
		wait for clk_period*10;
		enable <= '1';
		wait for clk_period*10;
		enable <= '0';
		wait for clk_period*10;
		entrada <= '0';  
		wait for clk_period*10;
		enable <= '1';
		wait for clk_period*10;
		enable <= '0';
		wait for clk_period*10;
		

      wait;
   end process;

END;
