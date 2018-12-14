--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:50:20 11/30/2018
-- Design Name:   
-- Module Name:   C:/Users/JUANBURRIS/Documents/DIGI/memoryRAM_Cedulas/sim_Top.vhd
-- Project Name:  memoryRAM_Cedulas
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sim_Top IS
END sim_Top;
 
ARCHITECTURE behavior OF sim_Top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top
    PORT(
         CLK_g : IN  std_logic;
         Dato_Valido : IN  std_logic;
         Dato_Entrada : IN  std_logic_vector(31 downto 0);
         Dato_Salida : OUT  std_logic_vector(31 downto 0);
         reset_g : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_g : std_logic := '0';
   signal Dato_Valido : std_logic := '0';
   signal Dato_Entrada : std_logic_vector(31 downto 0) := (others => '0');
   signal reset_g : std_logic := '0';

 	--Outputs
   signal Dato_Salida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_g_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          CLK_g => CLK_g,
          Dato_Valido => Dato_Valido,
          Dato_Entrada => Dato_Entrada,
          Dato_Salida => Dato_Salida,
          reset_g => reset_g
        );

   -- Clock process definitions
   CLK_g_process :process
   begin
		CLK_g <= '0';
		wait for CLK_g_period/2;
		CLK_g <= '1';
		wait for CLK_g_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset_g <= '1';
		wait for 100 ns;	
		reset_g <= '0';
      wait for 50 ns;

		wait for 50 ns;
		Dato_Valido <= '1';	
		Dato_Entrada <= "01000010001110110111110111111011";
		wait for 50 ns;	
		wait for 50 ns;
		Dato_Valido <= '0';	
		wait for 50 ns;	
			
		wait for 50 ns;	
		Dato_Valido<= '1';	
		Dato_Entrada <= "01000010001110110111110111111100";
		wait for 50 ns;	
		wait for 50 ns;
		Dato_Valido<= '0';	
		wait for 50 ns;	
		
		
		wait for 50 ns;	
		Dato_Valido <= '1';	
		Dato_Entrada <= "01000010001110110111110111111101";
		wait for 50 ns;	
		wait for 50 ns;
		Dato_Valido <= '0';	
		wait for 50 ns;
      
		wait for 50 ns;	
		Dato_Valido <= '1';	
		Dato_Entrada <= "01000010001110110111110111111110";
		wait for 50 ns;	
		wait for 50 ns;
		Dato_Valido <= '0';	
		wait for 50 ns;
		
		wait for 50 ns;	
		Dato_Valido <= '1';	
		Dato_Entrada <= "01000010001110110111111000000000";
		wait for 50 ns;	
		wait for 50 ns;
		Dato_Valido <= '0';	
		wait for 50 ns;

      wait;
   end process;

END;
