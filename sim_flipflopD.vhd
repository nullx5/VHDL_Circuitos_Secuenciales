
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY sim_flipflopD IS
END sim_flipflopD;
 
ARCHITECTURE behavior OF sim_flipflopD IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT flipflopD
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         enable : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: flipflopD PORT MAP (
          D => D,
          clk => clk,
          reset => reset,
          enable => enable,
          Q => Q
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
		D <= "0100100001001001";  --  ASCII --> "HI" 
		wait for clk_period*10;
		enable <= '1';
		wait for clk_period*10;
		D <= "0011101000101001"; --  ASCII --> ":)"
		wait for clk_period*10;
		reset <= '1';
		wait for clk_period*10;
		reset <= '0';
		wait for clk_period*10;
		D <= "0011101000101000"; --  ASCII --> ":("
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
