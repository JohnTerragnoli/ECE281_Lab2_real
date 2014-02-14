----------------------------------------------------------------------------------
-- Company: USAFA ECE 281 Super Team
-- Engineer: John Paul Terragnoli 
-- 
-- Create Date:    10:53:45 02/10/2014 
-- Design Name: 	4 Bit Adder!!
-- Module Name:    Four_Bit_Adder_Structural - Behavioral 
-- Project Name: 	Lab2
-- Target Devices: NEXYS 2
-- Tool versions: 1.0
-- Description: Adds or subtracts two 4-bit numbers.  
--
-- Dependencies: Full_Adder.vhd
--
-- Revision: NONE
-- Revision 0.01 - File Created
-- Additional Comments: NONE
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--Cin0 comes from the select.  helps negate B
--so that A-B can occur when a button is pressed.   
entity Four_Bit_Adder_Structural is
    Port ( Cin0 : in std_logic;
			  A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  OVERFLOW : out STD_LOGIC; 
           S : out  STD_LOGIC_VECTOR (3 downto 0));
end Four_Bit_Adder_Structural;

architecture Behavioral of Four_Bit_Adder_Structural is

--instanstiate the full adder component.   
component Full_Adder
port(
	Ain : in std_logic; 
	Bin : in std_logic; 
	Cin : in std_logic; --this is the carry in 
	Sout : out std_logic; 
	Cout : out std_logic); --this is the carry out 
End Component;

--DELCARATION OF INTERNAL SIGNALS GO HERE.
  
--should have them for internal carries: 
signal Cin0_Plexer : std_logic;
signal Cin1 : std_logic; 
signal Cin2 : std_logic; 
signal Cin3 : std_logic;


--place to dump the last carry. 
signal dump : std_logic;

 		
--BoutPlexer is the output from the multiplexer into the first adder
signal BoutPlexer : std_logic_vector (3 downto 0);

--middle wires needed to check for overflow.  
--this is basically going to be creating and altered version of a xnor gate.  
signal ABCin3_not, A_notB_notCin3:std_logic;

begin

--WHERE WE ACTUALL USE THE COMPONENTS: 

--this creates the two's compliment right from the start, if
--subtracting.  This makes only 1 multiplexer necessary.  
BoutPlexer <= B when Cin0 = '0'
		else std_logic_vector(UNSIGNED(not B)+1);

--0 adder: 
Adder_bit0: Full_Adder PORT MAP(
	Ain => A(0), 
	Bin => BoutPlexer(0), 
--how do you set something equal to ground?  
	Cin => '0', 
	Sout => S(0),
	Cout => Cin1
	);
	
--1 adder: 
Adder_bit1: Full_Adder PORT MAP(
	Ain => A(1), 
	Bin => BoutPlexer(1), 
	Cin => Cin1, 
	Sout => S(1),
	Cout => Cin2
	);
	
	--2 adder: 
Adder_bit2: Full_Adder PORT MAP(
	Ain => A(2), 
	Bin => BoutPlexer(2), 
	Cin => Cin2, 
	Sout => S(2),
	Cout => Cin3
	);
	
	--3 adder: 
Adder_bit3: Full_Adder PORT MAP(
	Ain => A(3), 
	Bin => BoutPlexer(3), 
	Cin => Cin3, 
	Sout => S(3),
	--it doesn't matter where this last carry goes!!!!
	Cout => dump
	);
	
	
--need to check for overflow!!!!
--kind of recreating an xnor gate :)  
ABCin3_not <= (A(3) and BoutPlexer(3) and (not Cin3));
A_notB_notCin3 <= ((not A(3)) and (not BoutPlexer(3)) and Cin3);
--if overflow occurs, then the right most LED will light up.  
OVERFLOW <= ABCin3_not or A_notB_notCin3;



end Behavioral;