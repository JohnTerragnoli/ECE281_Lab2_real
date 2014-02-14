ECE281_Lab2_real
================



#**Full Adder Creation and Testing**

A module was created for a full adder with the desired interface, as seen below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full%20Adder%20Interface.JPG "Full Adder Interface")


In order to do this, a truth table was made describing the desired output of the full adder.  This Truth Table can be seen below:  
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full%20Adder%20Truth%20Table.PNG "Full Adder Truth Table")

From this truth table, the output for the carry and the sum were calculated.  These calculations and resulting equations can be seen below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full%20Adder%20Cout%20logic.PNG "Carry Out Logic Calculations")

![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/full%20adder%20Sout%20Logic.PNG "Sum Logic Calculations")

Based off of these equations, the final schematic of the Full adder was made, shown below.  
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full%20Adder%20Schematic.JPG "Full Adder Schematic")

Based on this schematic, the code for the full adder was created.  The wires declared in the vhdl code are the same as shown on the schematic.  The code for the full adder can be seen here:  https://github.com/JohnTerragnoli/ECE281_Lab2_real/blob/master/Full_Adder.vhd 



This was used later in the lab to construct the 4 bit adder.  

In order to test that this was correct, then, a test bench was created.  This testbench tested every possible input for A, B and the Carry in.  The output data was then compared with the truth table to ensure that it was correct.  The Textbench code is here: https://github.com/JohnTerragnoli/ECE281_Lab2_real/blob/master/Full_Adder_Testbench.vhd  

A snapshot of the simulation results can be seen below. 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full_Adder_Testbench_Simulation.PNG "Full Adder Simulation Results")



#**Designing the Four Bit Adder**
After this 1 bit full adder was created, four of them were combined in order to create a four bit adder.  The carry out of the full adder before was inputed into the carry in of the full add following it.  At this point, A and B were input into the full adders without any changes.  This restricts the design to just adding.  

The Schematic of the four bit adder can be seen below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/4%20Bit%20Adder%20Schematic.JPG "$ Bit Add Schematic")


This schematic dictated the code made in the file that allowed the 4 bit adder to work.  This file can be seen here:https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder_Structural.vhd 



