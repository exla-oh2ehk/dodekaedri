EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:dodekaedri
LIBS:Oscillators
LIBS:dodekaedri-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "Frequency synthesizer for LOs and CPU clock generation"
Date "2016-09-22"
Rev "0.1"
Comp "PRK - OH2TI"
Comment1 "exla - OH2EHK"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	7450 4500 7550 4500
Wire Wire Line
	7100 4500 7250 4500
Wire Wire Line
	7150 3550 7150 3800
Wire Wire Line
	7500 3550 7150 3550
Wire Wire Line
	7350 3650 7350 3800
Wire Wire Line
	7500 3650 7350 3650
Wire Wire Line
	7150 4100 7150 4000
Wire Wire Line
	7100 4100 7150 4100
Wire Wire Line
	7350 4200 7350 4000
Wire Wire Line
	7100 4200 7350 4200
Connection ~ 3600 4500
Connection ~ 3900 4400
Wire Wire Line
	7600 3950 7600 4000
Wire Wire Line
	7600 3950 7900 3950
Wire Wire Line
	7450 4200 7450 4300
Connection ~ 4350 3000
Connection ~ 4350 3550
Wire Wire Line
	5000 3550 4350 3550
Connection ~ 5500 3550
Wire Wire Line
	5200 3550 5500 3550
Wire Wire Line
	5500 3300 5500 3900
Connection ~ 4350 3300
Wire Wire Line
	4350 2850 4350 3050
Wire Wire Line
	4700 3000 4350 3000
Wire Wire Line
	4700 3300 4350 3300
Wire Wire Line
	4700 3200 4700 3300
Wire Wire Line
	4350 3250 4350 4200
Connection ~ 6050 3550
Wire Wire Line
	5900 3550 6250 3550
Connection ~ 4350 3900
Wire Wire Line
	4350 4200 4500 4200
Connection ~ 4350 4050
Wire Wire Line
	4350 4050 4500 4050
Wire Wire Line
	4350 3900 4500 3900
Wire Wire Line
	5500 4200 5600 4200
Connection ~ 3750 3950
Wire Wire Line
	5900 3550 5900 3700
Wire Wire Line
	3600 3950 3900 3950
Wire Wire Line
	3600 4500 3600 4250
Wire Wire Line
	3450 4500 6250 4500
Wire Wire Line
	3900 4400 3900 4250
Wire Wire Line
	3450 4400 6250 4400
Wire Wire Line
	5800 4200 6250 4200
Wire Wire Line
	6250 3550 6250 4100
Wire Wire Line
	7900 3950 7900 4400
Wire Wire Line
	7900 4400 7100 4400
Wire Wire Line
	7450 4300 7100 4300
Wire Wire Line
	7450 4200 7600 4200
Wire Wire Line
	5900 3950 5900 3900
Text HLabel 7550 4500 2    60   Output ~ 0
CLK_CPU
$Comp
L R_Small R?
U 1 1 57E319F9
P 7350 4500
F 0 "R?" H 7380 4520 50  0000 L CNN
F 1 "50R" H 7380 4460 50  0000 L CNN
F 2 "" H 7350 4500 50  0000 C CNN
F 3 "" H 7350 4500 50  0000 C CNN
	1    7350 4500
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 57E31A00
P 7150 3900
F 0 "R?" H 7180 3920 50  0000 L CNN
F 1 "50R" H 7180 3860 50  0000 L CNN
F 2 "" H 7150 3900 50  0000 C CNN
F 3 "" H 7150 3900 50  0000 C CNN
	1    7150 3900
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 57E31A07
P 7350 3900
F 0 "R?" H 7380 3920 50  0000 L CNN
F 1 "50R" H 7380 3860 50  0000 L CNN
F 2 "" H 7350 3900 50  0000 C CNN
F 3 "" H 7350 3900 50  0000 C CNN
	1    7350 3900
	1    0    0    -1  
$EndComp
Text HLabel 7500 3550 2    60   Output ~ 0
LO_I
Text HLabel 7500 3650 2    60   Output ~ 0
LO_Q
Text HLabel 3450 4400 0    60   BiDi ~ 0
I2C1_SCL
Text HLabel 3450 4500 0    60   BiDi ~ 0
I2C1_SDA
Text Label 5500 3400 0    60   ~ 0
1,8Vrail
$Comp
L +Vlogic #PWR?
U 1 1 57E31A13
P 4350 2850
F 0 "#PWR?" H 4350 2650 50  0001 C CNN
F 1 "+Vlogic" H 4350 3050 50  0000 C CNN
F 2 "" H 4350 2850 50  0000 C CNN
F 3 "" H 4350 2850 50  0000 C CNN
	1    4350 2850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 57E31A19
P 5100 3550
F 0 "C?" H 5110 3620 50  0000 L CNN
F 1 "1µF" H 5110 3470 50  0000 L CNN
F 2 "" H 5100 3550 50  0000 C CNN
F 3 "" H 5100 3550 50  0000 C CNN
	1    5100 3550
	0    1    1    0   
$EndComp
$Comp
L C_Small C?
U 1 1 57E31A20
P 4350 3150
F 0 "C?" H 4360 3220 50  0000 L CNN
F 1 "1µF" H 4360 3070 50  0000 L CNN
F 2 "" H 4350 3150 50  0000 C CNN
F 3 "" H 4350 3150 50  0000 C CNN
	1    4350 3150
	1    0    0    -1  
$EndComp
$Comp
L LDO U?
U 1 1 57E31A27
P 5100 3100
F 0 "U?" H 5100 2800 60  0000 C CNN
F 1 "MIC5365" H 5100 3300 60  0000 C CNN
F 2 "" H 5100 3050 60  0001 C CNN
F 3 "" H 5100 3050 60  0001 C CNN
	1    5100 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 57E31A2E
P 4350 4200
F 0 "#PWR?" H 4350 3950 50  0001 C CNN
F 1 "GND" H 4350 4050 50  0000 C CNN
F 2 "" H 4350 4200 50  0000 C CNN
F 3 "" H 4350 4200 50  0000 C CNN
	1    4350 4200
	1    0    0    -1  
$EndComp
$Comp
L TCXO OSC?
U 1 1 57E31A34
P 5000 4050
F 0 "OSC?" H 5000 3800 60  0000 C CNN
F 1 "TCXO 26MHz" H 5000 4300 60  0000 C CNN
F 2 "" H 5050 4150 60  0001 C CNN
F 3 "" H 5050 4150 60  0001 C CNN
	1    5000 4050
	1    0    0    -1  
$EndComp
$Comp
L +Vlogic #PWR?
U 1 1 57E31A3B
P 3750 3950
F 0 "#PWR?" H 3750 3750 50  0001 C CNN
F 1 "+Vlogic" H 3750 4150 50  0000 C CNN
F 2 "" H 3750 3950 50  0000 C CNN
F 3 "" H 3750 3950 50  0000 C CNN
	1    3750 3950
	1    0    0    -1  
$EndComp
$Comp
L +Vlogic #PWR?
U 1 1 57E31A41
P 7600 3950
F 0 "#PWR?" H 7600 3750 50  0001 C CNN
F 1 "+Vlogic" H 7600 4150 50  0000 C CNN
F 2 "" H 7600 3950 50  0000 C CNN
F 3 "" H 7600 3950 50  0000 C CNN
	1    7600 3950
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 57E31A47
P 3600 4100
F 0 "R?" V 3680 4100 50  0000 C CNN
F 1 "10k" V 3600 4100 50  0000 C CNN
F 2 "" V 3530 4100 50  0000 C CNN
F 3 "" H 3600 4100 50  0000 C CNN
	1    3600 4100
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 57E31A4E
P 3900 4100
F 0 "R?" V 3980 4100 50  0000 C CNN
F 1 "10k" V 3900 4100 50  0000 C CNN
F 2 "" V 3830 4100 50  0000 C CNN
F 3 "" H 3900 4100 50  0000 C CNN
	1    3900 4100
	1    0    0    -1  
$EndComp
NoConn ~ 6250 4300
$Comp
L C_Small C?
U 1 1 57E31A56
P 5700 4200
F 0 "C?" H 5710 4270 50  0000 L CNN
F 1 "C_Small" H 5710 4120 50  0000 L CNN
F 2 "" H 5700 4200 50  0000 C CNN
F 3 "" H 5700 4200 50  0000 C CNN
	1    5700 4200
	0    1    1    0   
$EndComp
$Comp
L +Vlogic #PWR?
U 1 1 57E31A5D
P 6050 3550
F 0 "#PWR?" H 6050 3350 50  0001 C CNN
F 1 "+Vlogic" H 6050 3750 50  0000 C CNN
F 2 "" H 6050 3550 50  0000 C CNN
F 3 "" H 6050 3550 50  0000 C CNN
	1    6050 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 57E31A63
P 7600 4100
F 0 "C?" H 7610 4170 50  0000 L CNN
F 1 "100nF" H 7610 4020 50  0000 L CNN
F 2 "" H 7600 4100 50  0000 C CNN
F 3 "" H 7600 4100 50  0000 C CNN
	1    7600 4100
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 57E31A6A
P 5900 3800
F 0 "C?" H 5910 3870 50  0000 L CNN
F 1 "100nF" H 5910 3720 50  0000 L CNN
F 2 "" H 5900 3800 50  0000 C CNN
F 3 "" H 5900 3800 50  0000 C CNN
	1    5900 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 57E31A71
P 5900 3950
F 0 "#PWR?" H 5900 3700 50  0001 C CNN
F 1 "GND" H 5900 3800 50  0000 C CNN
F 2 "" H 5900 3950 50  0000 C CNN
F 3 "" H 5900 3950 50  0000 C CNN
	1    5900 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 57E31A77
P 7600 4200
F 0 "#PWR?" H 7600 3950 50  0001 C CNN
F 1 "GND" H 7600 4050 50  0000 C CNN
F 2 "" H 7600 4200 50  0000 C CNN
F 3 "" H 7600 4200 50  0000 C CNN
	1    7600 4200
	1    0    0    -1  
$EndComp
$Comp
L SI5351A U?
U 1 1 57E31A7D
P 6650 4300
F 0 "U?" H 6650 3950 60  0000 C CNN
F 1 "SI5351A" H 6650 4650 60  0000 C CNN
F 2 "" H 6650 4650 60  0001 C CNN
F 3 "" H 6650 4650 60  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
