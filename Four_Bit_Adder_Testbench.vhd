----------------------------------------------------------------------------------
-- Company: USAFA ECE 281 Super Team
-- Engineer: John Paul Terragnoli 
-- 
-- Create Date:    10:53:45 02/10/2014 
-- Design Name: 	4 Bit Adder Testbench!!
-- Module Name:    Four_Bit_Adder_Structural - Behavioral 
-- Project Name: 	Lab2
-- Target Devices: NEXYS 2
-- Tool versions: 1.0
-- Description: Tests the four bit adder  
--
-- VHDL Test Bench Created by ISE for module: Four_Bit_Adder_Structural
-- 
-- Dependencies: Four_Bit_Adder_Structural.vhd
-- 
-- Revision:  1.0
-- Revision 0.01 - File Created
-- Additional Comments: none
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
USE ieee.numeric_std.ALL;

--adds the ability to add standard logic vectors in this code.  
use ieee.std_logic_arith.all;

use ieee.std_logic_unsigned.all;
 
ENTITY Four_Bit_Adder_Testbench IS
END Four_Bit_Adder_Testbench;
 
	ARCHITECTURE behavior OF Four_Bit_Adder_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Four_Bit_Adder_Structural
    PORT(
         Cin0 : IN  std_logic;
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Initializing inputs
   signal Cin0 : std_logic := '0';
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Four_Bit_Adder_Structural PORT MAP (
          Cin0 => Cin0,
          A => A,
          B => B,
          S => S
        );


   -- Stimulus process
   stim_proc: process
   begin		
     wait for 1 ns;
		--tests all the inputs for A
		for i in 0 to 15 loop	
			--testas all of the inputs for B
			for j in 0 to 15 loop
			

				Cin0 <= '0';					
				assert (S  = A-B) report
				"check what S is:  " &std_logic'IMAGE(S(3)) &std_logic'IMAGE(S(2))&
					std_logic'IMAGE(S(1))& std_logic'IMAGE(S(0))&
				"Addition failed: A: " 
					&std_logic'IMAGE(A(3)) &std_logic'IMAGE(A(2))&
					std_logic'IMAGE(A(1))& std_logic'IMAGE(A(0))&
					" B: " & std_logic'IMAGE(B(3)) &std_logic'IMAGE(B(2))&
					std_logic'IMAGE(B(1))& std_logic'IMAGE(B(0));
--				assert false report "addition did we check out?";


				wait for 1 ns;	
				
			
				Cin0 <= '1';
				assert (S  = A+B) report
				"check what S is:  " &std_logic'IMAGE(S(3)) &std_logic'IMAGE(S(2))&
					std_logic'IMAGE(S(1))& std_logic'IMAGE(S(0))&
				"Subraction Failed: A: " 
					&std_logic'IMAGE(A(3)) &std_logic'IMAGE(A(2))&
					std_logic'IMAGE(A(1))& std_logic'IMAGE(A(0))&
					" B: " & std_logic'IMAGE(B(3)) &std_logic'IMAGE(B(2))&
					std_logic'IMAGE(B(1))& std_logic'IMAGE(B(0));
					
					
--				assert (S=((A+B)) false report "subtract did we check out?";
				wait for 1 ns;	
		 		
				B<=B+1;
			end loop;
			A<=A+1;
		end loop;
     wait;
   end process;

END;