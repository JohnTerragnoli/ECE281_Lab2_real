--------------------------------------------------------------------------------
-- Company: USAFA ECE281
-- Engineer: John Paul Terragnoli 
--
-- Create Date:   15:57:33 02/09/2014
-- Design Name:   Full_Adder_Testbench
-- Module Name:   C:/Users/C16John.Terragnoli/Documents/Documents/My Documents/Academics/Sophomore Year/Spring Semester/ECE 281/ISE Project Stuff/Lab2/Full_Adder_Testbench.vhd
-- Project Name:  Lab2
-- Target Device:  Full_Adder
-- Tool versions:  1.0
-- Description:   Runs through every possible combination of inputs for the Full_Adder
-- to make sure that it is working correctly.
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder
-- 
-- Dependencies: Full_Adder files
-- 
-- Revision: N/A
-- Revision 0.01 - File Created
-- Additional Comments: NONE
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
 
ENTITY Full_Adder_Testbench IS
END Full_Adder_Testbench;
 
ARCHITECTURE behavior OF Full_Adder_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         Ain : IN  std_logic;
         Bin : IN  std_logic;
         Cin : IN  std_logic;
         Sout : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Ain : std_logic := '0';
   signal Bin : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sout : std_logic;
   signal Cout : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          Ain => Ain,
          Bin => Bin,
          Cin => Cin,
          Sout => Sout,
          Cout => Cout
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- First line of truth table
		Ain <= '0';
		Bin <= '0';
		Cin <= '0';
		wait for 100 ns;	
		
		-- Second line of truth table
		Ain <= '0';
		Bin <= '0';
		Cin <= '1';
		wait for 100 ns;	
				
		 -- Third line of truth table
		Ain <= '0';
		Bin <= '1';
		Cin <= '0';
		wait for 100 ns;	
		
		 -- Fourth line of truth table
		Ain <= '0';
		Bin <= '1';
		Cin <= '1';
		wait for 100 ns;

 -- Fifth line of truth table
		Ain <= '1';
		Bin <= '0';
		Cin <= '0';
		wait for 100 ns;

 -- Sixth line of truth table
		Ain <= '1';
		Bin <= '0';
		Cin <= '1';
		wait for 100 ns;

 -- Seventh line of truth table
		Ain <= '1';
		Bin <= '1';
		Cin <= '0';
		wait for 100 ns;

 -- Eigth line of truth table
		Ain <= '1';
		Bin <= '1';
		Cin <= '1';
      wait;
   end process;

END;