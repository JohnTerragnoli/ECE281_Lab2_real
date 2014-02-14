ECE281_Lab2_real
================



#**Full Adder Creation and Testing**

A module was created for a full adder with the desired interface, as seen below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full%20Adder%20Interface.JPG "Full Adder Interface")


#Full Adder Truth Table
In order to do this, a truth table was made describing the desired output of the full adder.  This Truth Table can be seen below:  
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full%20Adder%20Truth%20Table.PNG "Full Adder Truth Table")


#Full Adder Boolean Equations 
From this truth table, the output for the carry  and the sum (Cout and S, respectively)were calculated.  These calculations and resulting equations can be seen below: 


![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full%20Adder%20Cout%20logic.PNG "Carry Out Logic Calculations")

![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/full%20adder%20Sout%20Logic.PNG "Sum Logic Calculations")

Note: The exact direction for how to perform these steps to arrive at a logic equation from a truth table can be seen in lab1.  The link to such general directions is here: https://raw.github.com/JohnTerragnoli/ECE281_Lab1/master/README.md under the K Map and Boolean Simplification Sections


#Full Adder Schematic and Code
Based off of these equations, the final schematic of the Full adder was made, shown below.  
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full%20Adder%20Schematic.JPG "Full Adder Schematic")

Based on this schematic, the code for the full adder was created.  The wires declared in the vhdl code are the same as shown on the schematic.  The code for the full adder can be seen here:  https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full_Adder_Testbench.vhd   


#Full Adder Testbench
In order to test that this full adder was correct, then, a test bench was created.  This testbench tested every possible input for A, B and the Carry in.  The output data was then compared with the truth table to ensure that the full adder code was correct.  The Textbench code is here: https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full_Adder_Testbench.vhd 


#Full Adder Simulation
A snapshot of the simulation results can be seen below. 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Full_Adder_Testbench_Simulation.PNG "Full Adder Simulation Results")

The outputs from this testbench happily match the truth table, therefore, the full adder was properly constructed.  




#**Designing the Four Bit Adder**
After this 1 bit full adder was created, four full adders were combined in series in order to create a four bit adder.  The carry out of the full adder before was inputed into the carry in of the full add following it.  At this point, A and B were input into the full adders without any changes.  This restricts the design to just adding, and allowed the Cin in the least significant bit to be 0.  The carry from the last full adder was ignored and dumped.  


#Four Bit Adder Block Diagram
The Schematic of the four bit adder can be seen below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/4%20Bit%20Adder%20Schematic.JPG "$ Bit Adder Block Diagram")

In order to replicate this schematic in a vhdl module, the full adder created earlier was used as a component four separate times, so that the code used in the full adder did not have to be written out four times. The Carry out of the full adders were made to be the carry in signals for the full adder one more significant bit above them (to the left on the picture).  That handles the carrys that happen in addition.  Then the specific bits of the inputs were sent to their respective full adders, as shown in the diagram. The output from the four full adders is the answer.  


This schematic dictated the code made in the file that allowed the 4 bit adder to work.  This file can be seen here:https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder_Structural.vhd 

It should be noted that this module is a later version and also contains the code for subtraction and overflow.  


#Four Bit Adder Testbench and Simulation
To test this vhdl module for the 4 bit adder, a testbench was created that would test every possible input to the four bit adder.  Since there are so many possible inputs, it was made using a for loop.  Also, "assert" statements were made, so that errors in the code could be pointed out exactly where they occur.  This was very helpful when trouble shooting and finding errors.  The code for this testbench can be seen here: 

https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder_Testbench.vhd 
Notice, this is the testbench for all possible adding and subracting inputs used to test the adder and subracter later in this lab.  However, the first assert statement is the code that tests addition.  If only addition needs to be tested, the second assert statement can just be removed.  

The results from this adder simulation can be seen below, even though this screen shot includes both the tests for the adder and subtractor.  
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four%20Bit%20Adder%20Simulation%20Results.PNG "Four Bit Adder Simulation Results")



#Outputing Adder Code to NEXYS2
Then, in order to output this data to the NEXYS2 board, a .ucf file needed to be created to assign the location of the outputs and inputs.  This .ucf file can be seen here: 
https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder.ucf  

Once this was done, the behavior of the hardware was tested.  It worked perfectly.  


#**Adding Subtracting Capabilities**
After it was confirmed that the adder worked, the ability to subtract two four bit numbers was added.  Subraction of A-B can occur when the button H13 is pressed down on the NEXYS2 board, and only when the button is HELD down.  To do this, the four bit adder module was modified.  Pressing the button down was added as an input to the four bit adder module.  When the button is not pressed down, the module will add A and B together and display the result on the LEDs above the switches on the NEXYS2 board.  If the button is held down, then the 2's compliment of the B inputed from the switches is added to A instead.  Taking the 2's compliment of a binary number is the same as putting a negative sign in front of it.  So adding A and B's 2's compliment is the same as A minus B.  

The block Diagram describing this logic can be seen below.  This is the final block diagram of the circuit.  Inside of the adder accounts for overflow, which is written about below.
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Subtractor%20Schematic.JPG "Integrating Subtraction Schematic")


Modifications were made to the four bit module to include the logic in the above block diagram.  This module can been seen below.  https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder_Structural.vhd  
Again, this file include modifications that were made farther in the lab, to include overflow notification.  


#Adder and Subtraction Testbench and Simulation
The original testbench for the four bit adder was modified with a second asser statement to test for subtraction.  These statements also returned errors if the subraction was not calculated properly by the code.   This testbench can be seen again here: https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder_Testbench.vhd

The simulation that resulted from this testbench is the same one show previously for just the adder.  It is reproduced below: 
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four%20Bit%20Adder%20Simulation%20Results.PNG "Adder and Subractor Simulation Results")

After analyzing these results, it was determined that there were no errors with the adder/subractor code.  


#Outputing Adder and Subtractor Code to NEXYS2
After these simulations were run without any errors, the .ucf file was updated to include the input button for subtraction.  This updated .ucf file is reproduced here: https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder.ucf

Once the code was uploaded, many test cases were run by hand.  All of the outputs were correct for their respective inputs.  

#**Checking for Overflow**
Checking for overflow was done for both addition and subraction.  This was done so that the user would know if overflow occured in the arithmitic, so the user would know that the result is inaccurate.  This was done by having an LED on the NEXYS2 board light up whenever overflow occured.  In order to check for overflow, two cases needed to raise a red flag.  If either of these following cases occur, then overflow has occured.  If two positive numbers are added together and negative answer results, or if two negative inputs are added together and the result is a positive output.  In 2's compliment, the most significant bit represents the sign of the binary number. A 1 in the most significant bit represents a negative number and a 0 a positive number.  Therefore, if the most significant bits in A and Bin (Bin refers to either B or B's compliment, depending on if adding or subracting is occuring, respectively) are both 0, and the carry into the last full adder is a 1, then overflow has occured.  If the most significant bits of A and Bin are both 1, and the carry into the last full adder is a 0, then overflow has occured.  If overflow has occured, then its value is 1.  If its value is 1, then the LED at R4 is going to light up to notify the user.  To do this, overflow was made to be an output of the main module.  


#Overflow Boolean Logic
The boolean equation for this truth was written here:
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Overflow%20Equation.PNG "Overflow Boolean Logic")

#Overflow Schematic
The boolean equation above was then developed into a schematic, see below:
![alt tag](https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Overflow%20Schematic.JPG "Overflow Schematic")


#Adding Overflow Code
The above schematic was the created in the main module using behavioral design.  This design is reproduced below:
https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder_Structural.vhd   

#Outputing to NEXYS2
The .ucf file was then updated to account for the output of the overflow.  This .ucf file is reproduced here: 
https://raw.github.com/JohnTerragnoli/ECE281_Lab2_real/master/Four_Bit_Adder.ucf



#**Trouble Shooting**
Something that took me a little too long to figure out was that there is a time limit on the simulations run through testbenches, or as least there is a way to set this limit.  When I first started to run my cases, and there was a 50ns delay in between each case, I could only get through about 8-9 cases.  I kept thinking there was something wrong with the logic in my testbench.  Then, I simply decreases the delay time in between each case and was able to view all beautiful 512 cases in the testbench.  



#**Documentation**
Captain Silva helped me understand how to use when/else statements to create a multiplexer in my main four bit adder module.  I used this to help the design perform subraction and addition when instructed to do so.  

