
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY sim_registro_8Bits IS
END sim_registro_8Bits;
 
ARCHITECTURE behavior OF sim_registro_8Bits IS 
 
 
 
    COMPONENT registro_8Bits
    PORT(
         clk : IN  std_logic;
         entrada : IN  std_logic_vector(7 downto 0);
         enable : IN  std_logic;
         reset : IN  std_logic;
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal enable : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registro_8Bits PORT MAP (
          clk => clk,
          entrada => entrada,
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
		reset <= '1';
		wait for clk_period*10;
		reset <= '0';
		wait for clk_period*10;
		entrada <= "11111111";   
		wait for clk_period*10;
		enable <= '1';
		wait for clk_period*10;
      enable <= '0';
		

      -- insert stimulus here 

      wait;
   end process;

END;
