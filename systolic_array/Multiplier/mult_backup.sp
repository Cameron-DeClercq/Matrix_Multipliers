* First line is treated as comment
.options list node post

* Include transistor models from the appropriate directory on the server
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45n1svt.inc'
.include '/opt/cadence/gpdk045/gpdk045_v_6_0/models/hspice/g45p1svt.inc'


** Define Parameters

.param tper = 750
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

** Generated for: hspiceD
** Generated on: Mar 21 22:23:00 2025
** Design library name: systolic_array
** Design cell name: Multiplier
** Design view name: schematic


*.TEMP 25.0
*.OPTION
*+    ARTIST=2
*+    INGOLD=2
*+    PARHIER=LOCAL
*+    PSF=2

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
xi1 net15 cin gnd vdd sum XOR
xi0 a b gnd vdd net15 XOR
xi4 net25 net24 gnd vdd cout NAND
xi3 a b gnd vdd net24 NAND
xi2 net15 cin gnd vdd net25 NAND
.ends Full_Adder
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: Multiplier
** View name: schematic

.subckt multiplier a0 a1 a2 a3 b0 b1 b2 b3 p0 p1 p2 p3 p4 p5 p6 p7 ah vdd gnd SIZE=1
xi23 b3 a3 gnd vdd net079 AND
xi15 b2 a0 gnd vdd net051 AND
xi14 b2 a1 gnd vdd net050 AND
xi13 b2 a2 gnd vdd net049 AND
xi7 b1 a0 gnd vdd net48 AND
xi5 b1 a2 gnd vdd net24 AND
xi4 b1 a1 gnd vdd net62 AND
xi2 b0 a2 gnd vdd net30 AND
xi1 b0 a1 gnd vdd net47 AND
xi0 b0 a0 gnd vdd p0 AND
xi22 b3 a2 gnd vdd net081 NAND
xi21 b3 a1 gnd vdd net082 NAND
xi20 b3 a0 gnd vdd net083 NAND
xi12 b2 a3 gnd vdd net052 NAND
xi6 b1 a3 gnd vdd net39 NAND
xi3 b0 a3 gnd vdd net42 NAND
xi31 net078 net083 net092 gnd p3 vdd Half_Adder
xi32 net088 ah net0107 gnd p7 vdd Half_Adder
xi30 net60 net051 net053 gnd p2 vdd Half_Adder
xi29 net47 net48 net45 gnd p1 vdd Half_Adder
xi28 net072 net079 net090 net088 gnd p6 vdd Full_Adder
xi27 net073 net081 net091 net090 gnd p5 vdd Full_Adder
xi26 net076 net082 net092 net091 gnd p4 vdd Full_Adder
xi19 net49 net052 net054 net072 gnd net073 vdd Full_Adder
xi18 net50 net049 net055 net054 gnd net076 vdd Full_Adder
xi17 net55 net050 net053 net055 gnd net078 vdd Full_Adder
xi11 net39 ah net54 net49 gnd net50 vdd Full_Adder
xi10 net42 net24 net59 net54 gnd net55 vdd Full_Adder
xi9 net30 net62 net45 net59 gnd net60 vdd Full_Adder
.ends

xmult1 a0 a1 a2 a3 b0 b1 b2 b3 p0 p1 p2 p3 p4 p5 p6 p7 ah vdd gnd multiplier SIZE=1


* transient analysis with 1ps step and 0.8ns stop time
.tran 1p 5n



.END





