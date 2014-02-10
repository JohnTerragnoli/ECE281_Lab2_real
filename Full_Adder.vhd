----------------------------------------------------------------------------------
-- Company: USAFA ECE281
-- Engineer: John Paul Terragnoli
-- 
-- Create Date:    15:47:23 02/09/2014 
-- Design Name: 	Full_Adder - Behavioral
-- Module Name:    Full_Adder - Behavioral 
-- Project Name: 	Lab2
-- Target Devices: 4 bit adder
-- Tool versions: 1.0
-- Description: Creates the basis for a 1 bit full adder, which will be used 
-- later through structural design to create a four bit adder.  
--
-- Dependencies: NONE
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
    Port ( Ain : in  STD_LOGIC;
           Bin : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sout : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is


signal A_NOT, B_NOT, Cin_NOT, D, E, F, G, H, I, J : STD_LOGIC;

begin

A_NOT <= not Ain; 
B_NOT <= not Bin; 
Cin_NOT <= NOT Cin; 

D <= Bin and Cin;
E <= Ain and B_NOT and Cin; 
F <= Ain and Bin and Cin_NOT; 

G<= A_NOT and Bin and Cin_NOT; 
H <= A_NOT AND B_NOT AND Cin; 
I <= Ain and Bin and Cin; 
J <= Ain and B_NOT and Cin_NOT; 

--these are the simplified boolean expressions for Cout and Sout.  
Cout <= D or E or F; 
Sout <= G or H or I or J; 

end Behavioral;

