*** README ***

** These are the only files that are truly relevant to the report, however, feel free to check out the others as well of you like!
** There is a GITHUB associated with this project at the following link: 
https://github.com/Cameron-DeClercq/Matrix_Multipliers/

- /systolic_array/sys_arr_ppl/input0.vec

	This file is the vector file for the second design's schematic and layout.
As it stands right now, the vector file inputs the sample multiplication shown in
the paper. Both spice files are configured to operate at their highest clock
frequencies possible, and could be ran through hspice as is. _prs is the schematic
netlist and _prl is the layout netlist. Other spice files are in the same directory,
but they are not the designs discussed in the paper. Here are the spice files:

	/systolic_array/sys_arr_ppl/sap_prs.sp
	/systolic_array/sys_arr_ppl/sap_prl.sp


- /systolic_array/sys_arr_unp/input0.vec
	Same as above, but for the first design. Here are the associated spice files:
	
	/systolic_array/sys_arr_unp/sau_prs.sp
	/systolic_array/sys_arr_unp/sau_prl.sp

-Matrix_maker.py (for .vec file gen.)
	Python file for random matrix generation. Two functions are in the file.
One function generates a random array of a random size within the design constraints,
and the other generates a fixed size array with random numbers within the design
constrains.
