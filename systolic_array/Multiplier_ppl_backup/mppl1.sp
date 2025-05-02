* First line is treated as comment
.options list node post

* Include transistor models from the appropriate directory on the server
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45n1svt.inc'
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45p1svt.inc'


** Define Parameters

.param tper = 500
.param tris = 50
.param tfall = 50
.param tpw = '(tper - tris - tfall)/2'
.param tdlay = 0
.param vdd_val=1.1

* Digital vector file for input
.vec 'input0.vec'

** Create pulse source as clock signal

Vpulse PHI 0 PULSE
+ 0 vdd_val
+ 'tdlay * 1p' 'tris * 1p' 'tfall * 1p'
+ 'tpw * 1p' 'tper * 1p'

** Add DC voltage
Vsupply vdd 0 vdd_val
Vgnd GND 0 0


** Library name: systolic_array
** Cell name: AND
** View name: schematic
.subckt AND a b gnd vdd y
mnm2 y net14 gnd gnd g45n1svt L=45e-9 W=120e-9 AD=16.8e-15 AS=16.8e-15 PD=520e-9 PS=520e-9 NRD=1.16667 NRS=1.16667 M=1
mnm3 net14 a net24 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm4 net24 b gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mpm0 net14 a vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mpm1 net14 b vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mpm2 y net14 vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
.ends AND
** End of subcircuit definition.

** Library name: lab1_virt
** Cell name: NAND
** View name: schematic
.subckt NAND a b gnd vdd y
mnm1 net16 b gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm0 y a net16 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mpm1 y a vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mpm0 y b vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
.ends NAND
** End of subcircuit definition.

** Library name: accumulator_bitslice
** Cell name: inv
** View name: schematic
.subckt inv a gnd vdd y
mnm0 y a gnd gnd g45n1svt L=45e-9 W=120e-9 AD=16.8e-15 AS=16.8e-15 PD=520e-9 PS=520e-9 NRD=1.16667 NRS=1.16667 M=1
mpm0 y a vdd vdd g45p1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
.ends inv
** End of subcircuit definition.

** Library name: accumulator_bitslice
** Cell name: XOR
** View name: schematic
.subckt XOR a b gnd vdd y
mpm3 y a net24 vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm2 y net010 net25 vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm1 net24 net09 vdd vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm0 net25 b vdd vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mnm3 net22 b gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm2 net23 net09 gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm1 y a net22 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm0 y net010 net23 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
xi2 a gnd vdd net010 inv
xi3 b gnd vdd net09 inv
.ends XOR
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: Half_Adder
** View name: schematic
.subckt Half_Adder a b cout gnd sum vdd
xi0 a b gnd vdd cout AND
xi1 a b gnd vdd sum XOR
.ends Half_Adder
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: Full_Adder
** View name: schematic
.subckt Full_Adder a b cin cout gnd sum vdd
xi10 b a gnd vdd net20 NAND
xi11 net21 net20 gnd vdd cout NAND
xi9 net8 cin gnd vdd net21 NAND
xi13 net8 cin gnd vdd sum XOR
xi12 a b gnd vdd net8 XOR
.ends Full_Adder
** End of subcircuit definition.

** Library name: accumulator_bitslice
** Cell name: FlipFlop
** View name: schematic
.subckt FlipFlop d gnd phi q vdd
mpm3 q net12 net26 vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm2 net13 phi net28 vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm1 net26 net13 vdd vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mpm0 net28 d vdd vdd g45p1svt L=45e-9 W=480e-9 AD=67.2e-15 AS=67.2e-15 PD=1.24e-6 PS=1.24e-6 NRD=291.667e-3 NRS=291.667e-3 M=1
mnm3 net25 net13 gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm2 net27 d gnd gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm1 q phi net25 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
mnm0 net13 net12 net27 gnd g45n1svt L=45e-9 W=240e-9 AD=33.6e-15 AS=33.6e-15 PD=760e-9 PS=760e-9 NRD=583.333e-3 NRS=583.333e-3 M=1
xi0 phi gnd vdd net12 inv
.ends FlipFlop
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: dreg1b
** View name: schematic
.subckt dreg1b a ap gnd phi rst vdd
xi0 a rst gnd vdd net16 NAND
xi1 net16 gnd phi net15 vdd FlipFlop
xi2 net15 gnd vdd ap inv
.ends dreg1b
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: dreg5b
** View name: schematic
.subckt dreg5b a0 a0p a1 a1p a2 a2p a3 a3p a4 a4p gnd phi rst vdd
xi4 a4 a4p gnd phi rst vdd dreg1b
xi3 a3 a3p gnd phi rst vdd dreg1b
xi2 a2 a2p gnd phi rst vdd dreg1b
xi1 a1 a1p gnd phi rst vdd dreg1b
xi0 a0 a0p gnd phi rst vdd dreg1b
.ends dreg5b
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: dreg8b
** View name: schematic
.subckt dreg8b a0 a0p a1 a1p a2 a2p a3 a3p a4 a4p a5 a5p a6 a6p a7 a7p gnd phi rst vdd
xi0 a0 a0p a1 a1p a2 a2p a3 a3p a4 a4p gnd phi rst vdd dreg5b
xi3 a7 a7p gnd phi rst vdd dreg1b
xi2 a6 a6p gnd phi rst vdd dreg1b
xi1 a5 a5p gnd phi rst vdd dreg1b
.ends dreg8b
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: dreg4b
** View name: schematic
.subckt dreg4b a0 a0p a1 a1p a2 a2p a3 a3p gnd phi rst vdd
xi3 a3 a3p gnd phi rst vdd dreg1b
xi2 a2 a2p gnd phi rst vdd dreg1b
xi1 a1 a1p gnd phi rst vdd dreg1b
xi0 a0 a0p gnd phi rst vdd dreg1b
.ends dreg4b
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: Multiplier_ppl
** View name: schematic
xi23 b3 a3 gnd vdd net079 AND
xi15 b2 a0 gnd vdd net051 AND
xi14 b2 a1 gnd vdd net050 AND
xi13 b2 a2 gnd vdd net049 AND
xi7 b1 a0 gnd vdd net48 AND
xi5 b1 a2 gnd vdd net24 AND
xi4 b1 a1 gnd vdd net62 AND
xi2 b0 a2 gnd vdd net30 AND
xi1 b0 a1 gnd vdd net47 AND
xi0 b0 a0 gnd vdd net0139 AND
xi22 b3 a2 gnd vdd net081 NAND
xi21 b3 a1 gnd vdd net082 NAND
xi20 b3 a0 gnd vdd net083 NAND
xi12 net0104 net0103 gnd vdd net052 NAND
xi6 b1 a3 gnd vdd net39 NAND
xi3 b0 a3 gnd vdd net42 NAND
xi31 net078 net0157 net092 gnd p3 vdd Half_Adder
xi32 net088 vdd net0107 gnd p7 vdd Half_Adder
xi30 net60 net051 net053 gnd net0137 vdd Half_Adder
xi29 net47 net48 net45 gnd net0138 vdd Half_Adder
xi28 net072 net0136 net090 net088 gnd p6 vdd Full_Adder
xi27 net073 net0159 net091 net090 gnd p5 vdd Full_Adder
xi26 net076 net0161 net092 net091 gnd p4 vdd Full_Adder
xi19 net0117 net052 net054 net072 gnd net073 vdd Full_Adder
xi18 net0112 net0113 net055 net054 gnd net076 vdd Full_Adder
xi17 net0111 net0115 net0110 net055 gnd net078 vdd Full_Adder
xi11 net39 vdd net54 net49 gnd net50 vdd Full_Adder
xi10 net42 net24 net59 net54 gnd net55 vdd Full_Adder
xi9 net30 net62 net45 net59 gnd net60 vdd Full_Adder
xi33 net053 net0110 net55 net0111 net050 net0115 net50 net0112 net049 net0113 net49 net0117 b2 net0103 a3 net0104 gnd phi rst vdd dreg8b
xi38 net083 net0157 net082 net0161 net081 net0159 net079 net0136 gnd phi rst vdd dreg4b
xi37 net0137 p2 gnd phi rst vdd dreg1b
xi36 net0138 p1 gnd phi rst vdd dreg1b
xi35 net0139 p0 gnd phi rst vdd dreg1b

* transient analysis with 1ps step and 0.8ns stop time
.tran 1p 5n



.END















