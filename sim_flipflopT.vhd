
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY sim_flipflopT IS
END sim_flipflopT;
 
ARCHITECTURE behavior OF sim_flipflopT IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT flipflopT
    PORT(
         CLK : IN  std_logic;
         enable : IN  std_logic;
         reset : IN  std_logic;
         T : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal enable : std_logic := '0';
   signal reset : std_logic := '0';
   signal T : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: flipflopT PORT MAP (
          CLK => CLK,
          enable => enable,
          reset => reset,
          T => T,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;
		reset <= '1';           -- reset al flipflop
		wait for clk_period*10;
		reset <= '0';           -- puesta a cero aal flipflop
		wait for clk_period*10;
		T <= '1';   
		wait for clk_period*10;
		enable <= '1';
		wait for clk_period*10;
		enable <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
