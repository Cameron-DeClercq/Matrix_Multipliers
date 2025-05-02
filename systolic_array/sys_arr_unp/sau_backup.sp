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
** Cell name: faabs
** View name: schematic
.subckt faabs a cin cout gnd phi rst sout vdd
xi0 a sout cin cout gnd net017 vdd Full_Adder
xi1 rst net017 gnd vdd net21 NAND
xi2 net21 gnd phi net20 vdd FlipFlop
xi3 net20 gnd vdd sout inv
.ends faabs
** End of subcircuit definition.

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

** Library name: systolic_array
** Cell name: Half_Adder
** View name: schematic
.subckt Half_Adder a b cout gnd sum vdd
xi0 a b gnd vdd cout AND
xi1 a b gnd vdd sum XOR
.ends Half_Adder
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: Multiplier
** View name: schematic
.subckt Multiplier a0 a1 a2 a3 b0 b1 b2 b3 gnd p0 p1 p2 p3 p4 p5 p6 p7 vdd
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
xi32 net088 vdd net0107 gnd p7 vdd Half_Adder
xi30 net60 net051 net053 gnd p2 vdd Half_Adder
xi29 net47 net48 net45 gnd p1 vdd Half_Adder
xi28 net072 net079 net090 net088 gnd p6 vdd Full_Adder
xi27 net073 net081 net091 net090 gnd p5 vdd Full_Adder
xi26 net076 net082 net092 net091 gnd p4 vdd Full_Adder
xi19 net49 net052 net054 net072 gnd net073 vdd Full_Adder
xi18 net50 net049 net055 net054 gnd net076 vdd Full_Adder
xi17 net55 net050 net053 net055 gnd net078 vdd Full_Adder
xi11 net39 vdd net54 net49 gnd net50 vdd Full_Adder
xi10 net42 net24 net59 net54 gnd net55 vdd Full_Adder
xi9 net30 net62 net45 net59 gnd net60 vdd Full_Adder
.ends Multiplier
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: proc_el
** View name: schematic
.subckt proc_el a0 a0p a1 a1p a2 a2p a3 a3p b0 b0p b1 b1p b2 b2p b3 b3p gnd phi rst s0 s1 s2 s3 s4 s5 s6 s7 vdd
xi8 net13 net14 net21 gnd phi rst s7 vdd faabs
xi7 net12 net15 net14 gnd phi rst s6 vdd faabs
xi6 net11 net16 net15 gnd phi rst s5 vdd faabs
xi5 net10 net17 net16 gnd phi rst s4 vdd faabs
xi4 net9 net18 net17 gnd phi rst s3 vdd faabs
xi3 net8 net19 net18 gnd phi rst s2 vdd faabs
xi2 net7 net20 net19 gnd phi rst s1 vdd faabs
xi1 net6 gnd net20 gnd phi rst s0 vdd faabs
xi9 a0p a1p a2p a3p b0p b1p b2p b3p gnd net6 net7 net8 net9 net10 net11 net12 net13 vdd Multiplier
xi27 rst b3 gnd vdd net060 NAND
xi26 rst b2 gnd vdd net061 NAND
xi25 rst b1 gnd vdd net062 NAND
xi24 rst b0 gnd vdd net063 NAND
xi23 rst a3 gnd vdd net064 NAND
xi22 rst a2 gnd vdd net065 NAND
xi21 rst a1 gnd vdd net066 NAND
xi20 rst a0 gnd vdd net067 NAND
xi35 net060 gnd phi net053 vdd FlipFlop
xi34 net061 gnd phi net054 vdd FlipFlop
xi33 net062 gnd phi net055 vdd FlipFlop
xi32 net063 gnd phi net056 vdd FlipFlop
xi31 net064 gnd phi net057 vdd FlipFlop
xi30 net065 gnd phi net058 vdd FlipFlop
xi29 net066 gnd phi net059 vdd FlipFlop
xi28 net067 gnd phi net085 vdd FlipFlop
xi43 net053 gnd vdd b3p inv
xi42 net054 gnd vdd b2p inv
xi41 net055 gnd vdd b1p inv
xi40 net056 gnd vdd b0p inv
xi39 net057 gnd vdd a3p inv
xi38 net058 gnd vdd a2p inv
xi37 net059 gnd vdd a1p inv
xi36 net085 gnd vdd a0p inv
.ends proc_el
** End of subcircuit definition.

** Library name: systolic_array
** Cell name: sys_arr_unp
** View name: schematic
xi15 net385 net446 net384 net447 net383 net448 net382 net449 net406 net450 net407 net451 net408 net452 net409 net453 gnd phi rst s33_0 s33_1 s33_2 s33_3 s33_4 s33_5 s33_6 s33_7 vdd proc_el
xi14 net389 net385 net388 net384 net387 net383 net386 net382 net402 net454 net403 net455 net404 net456 net405 net457 gnd phi rst s23_0 s23_1 s23_2 s23_3 s23_4 s23_5 s23_6 s23_7 vdd proc_el
xi13 net393 net389 net392 net388 net391 net387 net390 net386 net394 net458 net395 net459 net396 net460 net397 net461 gnd phi rst s13_0 s13_1 s13_2 s13_3 s13_4 s13_5 s13_6 s13_7 vdd proc_el
xi12 a03_0 net393 a03_1 net392 a03_2 net391 a03_3 net390 net366 net462 net367 net463 net368 net464 net369 net465 gnd phi rst s03_0 s03_1 s03_2 s03_3 s03_4 s03_5 s03_6 s03_7 vdd proc_el
xi11 a02_0 net362 a02_1 net363 a02_2 net364 a02_3 net365 net361 net366 net360 net367 net359 net368 net358 net369 gnd phi rst s02_0 s02_1 s02_2 s02_3 s02_4 s02_5 s02_6 s02_7 vdd proc_el
xi10 net362 net401 net363 net400 net364 net399 net365 net398 net437 net394 net436 net395 net435 net396 net434 net397 gnd phi rst s12_0 s12_1 s12_2 s12_3 s12_4 s12_5 s12_6 s12_7 vdd proc_el
xi9 net401 net413 net400 net412 net399 net411 net398 net410 net433 net402 net432 net403 net431 net404 net430 net405 gnd phi rst s22_0 s22_1 s22_2 s22_3 s22_4 s22_5 s22_6 s22_7 vdd proc_el
xi8 net413 net466 net412 net467 net411 net468 net410 net469 net429 net406 net428 net407 net427 net408 net426 net409 gnd phi rst s32_0 s32_1 s32_2 s32_3 s32_4 s32_5 s32_6 s32_7 vdd proc_el
xi7 net425 net421 net424 net420 net423 net419 net422 net418 net374 net437 net375 net436 net376 net435 net377 net434 gnd phi rst s11_0 s11_1 s11_2 s11_3 s11_4 s11_5 s11_6 s11_7 vdd proc_el
xi6 a01_0 net425 a01_1 net424 a01_2 net423 a01_3 net422 net445 net361 net444 net360 net443 net359 net442 net358 gnd phi rst s01_0 s01_1 s01_2 s01_3 s01_4 s01_5 s01_6 s01_7 vdd proc_el
xi5 net421 net417 net420 net416 net419 net415 net418 net414 net441 net433 net440 net432 net439 net431 net438 net430 gnd phi rst s21_0 s21_1 s21_2 s21_3 s21_4 s21_5 s21_6 s21_7 vdd proc_el
xi4 net417 net470 net416 net471 net415 net472 net414 net473 net350 net429 net351 net428 net352 net427 net353 net426 gnd phi rst s31_0 s31_1 s31_2 s31_3 s31_4 s31_5 s31_6 s31_7 vdd proc_el
xi3 net354 net474 net355 net475 net356 net476 net357 net477 b30_0 net350 b30_1 net351 b30_2 net352 b30_3 net353 gnd phi rst s30_0 s30_1 s30_2 s30_3 s30_4 s30_5 s30_6 s30_7 vdd proc_el
xi2 net370 net354 net371 net355 net372 net356 net373 net357 b20_0 net441 b20_1 net440 b20_2 net439 b20_3 net438 gnd phi rst s20_0 s20_1 s20_2 s20_3 s20_4 s20_5 s20_6 s20_7 vdd proc_el
xi1 net378 net370 net478 net371 net380 net372 net381 net373 b10_0 net374 b10_1 net375 b10_2 net376 b10_3 net377 gnd phi rst s10_0 s10_1 s10_2 s10_3 s10_4 s10_5 s10_6 s10_7 vdd proc_el
xi0 a00_0 net378 a00_1 net478 a00_2 net380 a00_3 net381 b00_0 net445 b00_1 net444 b00_2 net443 b00_3 net442 gnd phi rst s00_0 s00_1 s00_2 s00_3 s00_4 s00_5 s00_6 s00_7 vdd proc_el


* transient analysis with 1ps step and 0.8ns stop time
.tran 1p 5n



.END



