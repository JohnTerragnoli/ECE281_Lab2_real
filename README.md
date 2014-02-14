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

In order to test that this full adder was correct, then, a test bench was created.  This testbench tested every possible input for A, B and the Carry in.  The output data was then compared with the truth table to ensure that the full adder code was correct.  The Textbench code is here: https://github.com/JohnTerragnoli/ECE281_Lab2_real/blob/master/Full_Adder_Testbench.vhd  

A snapshot of the simulation results can be seen below. 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full_Adder_Testbench_Simulation.PNG "Full Adder Simulation Results")

The outputs from this testbench happily match the truth table, therefore, the full adder was properly constructed.  




#**Designing the Four Bit Adder**
After this 1 bit full adder was created, four of full adders were combined in series in order to create a four bit adder.  The carry out of the full adder before was inputed into the carry in of the full add following it.  At this point, A and B were input into the full adders without any changes.  This restricts the design to just adding, and allowed the Cin in the least significant bit to be 0.  The carry from the last full adder was ignored and dumped.  

The Schematic of the four bit adder can be seen below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/4%20Bit%20Adder%20Schematic.JPG "$ Bit Add Schematic")

In order to replicate this schematic in a vhdl module, the full adder created earlier was used as a component four separate times, so that the code used in the full adder did not have to be written out four times.  


This schematic dictated the code made in the file that allowed the 4 bit adder to work.  This file can be seen here:https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder_Structural.vhd 

To test this vhdl module for the 4 bit adder, a testbench was created that would test every possible input to the four bit adder.  Since there are so many possible inputs, it was made using a for loop.  Also, "assert" statements were made, so that errors in the code could be pointed out exactly where they occur.  This was very helpful when trouble shooting and finding errors.  The code for this testbench can be seen here: 

https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder_Testbench.vhd
Notice, this is the testbench for all possible adding and subracting inputs used to test the adder and subracter later in this lab.  However, the first assert statement is the code that tests addition.  If only addition needs to be tested, the second assert statement can just be removed.  

The reults from this adder simulation can be seen below, even though this screen shot includes both the tests for the adder and subtractor.  
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four%20Bit%20Adder%20Simulation%20Results.PNG "Four Bit Adder Simulation Results")




