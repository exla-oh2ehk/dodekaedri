EESchema Schematic File Version 2
LIBS:dodekaedri-rescue
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
LIBS:stm32
LIBS:dodekaedri-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 8
Title "RX chain"
Date "2016-09-30"
Rev "1.0"
Comp "PRK - OH2TI"
Comment1 "exla - OH2EHK"
Comment2 "tejeez - OH2EAT"
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1650 2600 0    60   Input ~ 0
RX_CHAIN
$Comp
L GND #PWR040
U 1 1 57E45141
P 1800 3600
F 0 "#PWR040" H 1800 3350 50  0001 C CNN
F 1 "GND" H 1800 3450 50  0000 C CNN
F 2 "" H 1800 3600 50  0000 C CNN
F 3 "" H 1800 3600 50  0000 C CNN
	1    1800 3600
	1    0    0    -1  
$EndComp
$Comp
L TRANSFO2 T601
U 1 1 57E45159
P 2200 3100
F 0 "T601" H 2200 3600 50  0000 C CNN
F 1 "TRANSFO2" H 2200 2600 50  0000 C CNN
F 2 "dodekaedri:transf_5_pin" H 2200 3100 50  0001 C CNN
F 3 "" H 2200 3100 50  0000 C CNN
	1    2200 3100
	1    0    0    -1  
$EndComp
$Comp
L 74LVC1G3157 U601
U 1 1 57E45213
P 3350 2800
F 0 "U601" H 3350 2550 60  0000 C CNN
F 1 "74LVC1G3157" H 3350 3050 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 3350 2700 60  0001 C CNN
F 3 "" H 3350 2700 60  0001 C CNN
	1    3350 2800
	1    0    0    -1  
$EndComp
$Comp
L 74LVC1G3157 U602
U 1 1 57E4524A
P 3350 3400
F 0 "U602" H 3350 3150 60  0000 C CNN
F 1 "74LVC1G3157" H 3350 3650 60  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-23-6_Handsoldering" H 3350 3300 60  0001 C CNN
F 3 "" H 3350 3300 60  0001 C CNN
	1    3350 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR041
U 1 1 57E45302
P 2800 3800
F 0 "#PWR041" H 2800 3550 50  0001 C CNN
F 1 "GND" H 2800 3650 50  0000 C CNN
F 2 "" H 2800 3800 50  0000 C CNN
F 3 "" H 2800 3800 50  0000 C CNN
	1    2800 3800
	1    0    0    -1  
$EndComp
$Comp
L +Vlogic #PWR042
U 1 1 57E45597
P 4000 2550
F 0 "#PWR042" H 4000 2350 50  0001 C CNN
F 1 "+Vlogic" H 4000 2750 50  0000 C CNN
F 2 "" H 4000 2550 50  0000 C CNN
F 3 "" H 4000 2550 50  0000 C CNN
	1    4000 2550
	1    0    0    -1  
$EndComp
Text HLabel 3350 2250 0    60   Input ~ 0
LO_I
Text HLabel 3350 2150 0    60   Input ~ 0
LO_Q
$Comp
L R R601
U 1 1 57E45986
P 4350 2900
F 0 "R601" V 4430 2900 50  0000 C CNN
F 1 "100R" V 4350 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4280 2900 50  0001 C CNN
F 3 "" H 4350 2900 50  0000 C CNN
	1    4350 2900
	1    0    0    -1  
$EndComp
$Comp
L R R602
U 1 1 57E459C1
P 4350 3900
F 0 "R602" V 4430 3900 50  0000 C CNN
F 1 "100R" V 4350 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4280 3900 50  0001 C CNN
F 3 "" H 4350 3900 50  0000 C CNN
	1    4350 3900
	1    0    0    -1  
$EndComp
$Comp
L C C602
U 1 1 57E45A29
P 4350 3200
F 0 "C602" H 4375 3300 50  0000 L CNN
F 1 "68nF" H 4375 3100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4388 3050 50  0001 C CNN
F 3 "" H 4350 3200 50  0000 C CNN
	1    4350 3200
	1    0    0    -1  
$EndComp
$Comp
L C C603
U 1 1 57E45A80
P 4350 4200
F 0 "C603" H 4375 4300 50  0000 L CNN
F 1 "68nF" H 4375 4100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4388 4050 50  0001 C CNN
F 3 "" H 4350 4200 50  0000 C CNN
	1    4350 4200
	1    0    0    -1  
$EndComp
$Comp
L C C605
U 1 1 57E45ACF
P 5800 4000
F 0 "C605" H 5825 4100 50  0000 L CNN
F 1 "68nF" H 5825 3900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5838 3850 50  0001 C CNN
F 3 "" H 5800 4000 50  0000 C CNN
	1    5800 4000
	-1   0    0    1   
$EndComp
$Comp
L C C604
U 1 1 57E45BC5
P 5800 3000
F 0 "C604" H 5825 3100 50  0000 L CNN
F 1 "68nF" H 5825 2900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5838 2850 50  0001 C CNN
F 3 "" H 5800 3000 50  0000 C CNN
	1    5800 3000
	1    0    0    -1  
$EndComp
$Comp
L FILTERINDUCTOR L601
U 1 1 57E45F48
P 4750 2650
F 0 "L601" V 4650 2650 50  0000 C CNN
F 1 "470µH" V 4850 2650 50  0000 C CNN
F 2 "dodekaedri:SMT_1007" H 4750 2650 50  0001 C CNN
F 3 "" H 4750 2650 50  0000 C CNN
	1    4750 2650
	0    -1   -1   0   
$EndComp
$Comp
L FILTERINDUCTOR L603
U 1 1 57E45FC9
P 5400 2650
F 0 "L603" V 5300 2650 50  0000 C CNN
F 1 "470µH" V 5500 2650 50  0000 C CNN
F 2 "dodekaedri:SMT_1007" H 5400 2650 50  0001 C CNN
F 3 "" H 5400 2650 50  0000 C CNN
	1    5400 2650
	0    -1   -1   0   
$EndComp
$Comp
L FILTERINDUCTOR L602
U 1 1 57E47294
P 4750 3650
F 0 "L602" V 4650 3650 50  0000 C CNN
F 1 "470µH" V 4850 3650 50  0000 C CNN
F 2 "dodekaedri:SMT_1007" H 4750 3650 50  0001 C CNN
F 3 "" H 4750 3650 50  0000 C CNN
	1    4750 3650
	0    -1   -1   0   
$EndComp
$Comp
L FILTERINDUCTOR L604
U 1 1 57E47303
P 5400 3650
F 0 "L604" V 5300 3650 50  0000 C CNN
F 1 "470µH" V 5500 3650 50  0000 C CNN
F 2 "dodekaedri:SMT_1007" H 5400 3650 50  0001 C CNN
F 3 "" H 5400 3650 50  0000 C CNN
	1    5400 3650
	0    -1   -1   0   
$EndComp
$Comp
L TL972IDR U603
U 1 1 57E48699
P 7500 3450
F 0 "U603" H 7500 3150 60  0000 C CNN
F 1 "TL972IDR" H 7500 3750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 7550 3450 60  0001 C CNN
F 3 "" H 7550 3450 60  0001 C CNN
	1    7500 3450
	1    0    0    -1  
$EndComp
$Comp
L +Vlogic #PWR043
U 1 1 57E48734
P 8000 3250
F 0 "#PWR043" H 8000 3050 50  0001 C CNN
F 1 "+Vlogic" H 8000 3450 50  0000 C CNN
F 2 "" H 8000 3250 50  0000 C CNN
F 3 "" H 8000 3250 50  0000 C CNN
	1    8000 3250
	1    0    0    -1  
$EndComp
$Comp
L R R603
U 1 1 57E487DB
P 6150 2900
F 0 "R603" V 6230 2900 50  0000 C CNN
F 1 "100R" V 6150 2900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6080 2900 50  0001 C CNN
F 3 "" H 6150 2900 50  0000 C CNN
	1    6150 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR044
U 1 1 57E4894A
P 7000 3700
F 0 "#PWR044" H 7000 3450 50  0001 C CNN
F 1 "GND" H 7000 3550 50  0000 C CNN
F 2 "" H 7000 3700 50  0000 C CNN
F 3 "" H 7000 3700 50  0000 C CNN
	1    7000 3700
	1    0    0    -1  
$EndComp
Text HLabel 8450 2900 2    60   Output ~ 0
RX_I
Text HLabel 8450 3400 2    60   Output ~ 0
RX_Q
Text HLabel 1400 4350 0    60   Input ~ 0
RX_BIAS
Wire Wire Line
	1800 3300 1800 3600
Wire Wire Line
	2600 3000 2600 3200
Wire Wire Line
	2600 3500 2950 3500
Wire Wire Line
	2600 2700 2950 2700
Wire Wire Line
	2950 2800 2800 2800
Wire Wire Line
	2800 2800 2800 3800
Wire Wire Line
	2950 3400 2800 3400
Connection ~ 2800 3400
Wire Wire Line
	2950 3300 2850 3300
Wire Wire Line
	2850 3300 2850 2700
Connection ~ 2850 2700
Wire Wire Line
	2600 3100 2700 3100
Wire Wire Line
	2700 3100 2700 4350
Connection ~ 2600 3100
Wire Wire Line
	2950 2900 2900 2900
Wire Wire Line
	2900 2900 2900 3500
Connection ~ 2900 3500
Wire Wire Line
	3750 2800 4000 2800
Wire Wire Line
	4000 2550 4000 3400
Wire Wire Line
	4000 3400 3750 3400
Connection ~ 4000 2800
Wire Wire Line
	3350 2250 3750 2250
Wire Wire Line
	3750 2250 3750 2700
Wire Wire Line
	3350 2150 3850 2150
Wire Wire Line
	3850 2150 3850 3300
Wire Wire Line
	3850 3300 3750 3300
Wire Wire Line
	4350 2750 4350 2650
Connection ~ 4350 2750
Wire Wire Line
	5050 2650 5100 2650
Wire Wire Line
	5700 2650 6150 2650
Wire Wire Line
	5050 3650 5100 3650
Wire Wire Line
	4350 3750 4350 3650
Wire Wire Line
	4000 3650 4450 3650
Wire Wire Line
	5700 3650 6250 3650
Wire Wire Line
	4350 2650 4450 2650
Wire Wire Line
	3750 3500 4000 3500
Wire Wire Line
	4000 3500 4000 3650
Connection ~ 4350 3650
Wire Wire Line
	3750 2900 4150 2900
Wire Wire Line
	4150 2900 4150 2750
Wire Wire Line
	4150 2750 4350 2750
Wire Wire Line
	8000 3250 8000 3300
Wire Wire Line
	6150 2650 6150 2750
Connection ~ 5800 2650
Wire Wire Line
	6150 3050 6150 3400
Wire Wire Line
	6150 3400 7000 3400
Wire Wire Line
	7000 3500 6050 3500
Wire Wire Line
	7000 3600 7000 3700
Wire Wire Line
	8100 3500 8100 4050
Wire Wire Line
	8100 3500 8000 3500
Connection ~ 5800 3650
Wire Wire Line
	8000 4350 8000 3600
Wire Wire Line
	7000 3300 7000 2900
Wire Wire Line
	6850 2900 8450 2900
Wire Wire Line
	8000 3400 8450 3400
Wire Wire Line
	1400 4350 8000 4350
Connection ~ 5800 4350
Connection ~ 2700 4350
Connection ~ 4350 4350
Text Label 1700 4350 0    60   ~ 0
RX_BIAS
Wire Wire Line
	6050 3500 6050 3350
Wire Wire Line
	6050 3350 4150 3350
Connection ~ 5800 3350
Wire Wire Line
	4150 3350 4150 4350
Connection ~ 4150 4350
Connection ~ 4350 3350
Wire Wire Line
	1800 2600 1800 2900
Wire Wire Line
	1650 2600 1800 2600
$Comp
L R R604
U 1 1 57EAD8F4
P 6250 3850
F 0 "R604" V 6330 3850 50  0000 C CNN
F 1 "100R" V 6250 3850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6180 3850 50  0001 C CNN
F 3 "" H 6250 3850 50  0000 C CNN
	1    6250 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	8100 4050 6250 4050
Wire Wire Line
	5800 2650 5800 2850
Wire Wire Line
	5800 3150 5800 3350
Wire Wire Line
	5800 3650 5800 3850
Wire Wire Line
	5800 4150 5800 4350
$Comp
L C C601
U 1 1 57EAE0D5
P 2400 3900
F 0 "C601" H 2425 4000 50  0000 L CNN
F 1 "100nF" H 2425 3800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2438 3750 50  0001 C CNN
F 3 "" H 2400 3900 50  0000 C CNN
	1    2400 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR045
U 1 1 57EAE15A
P 2400 4100
F 0 "#PWR045" H 2400 3850 50  0001 C CNN
F 1 "GND" H 2400 3950 50  0000 C CNN
F 2 "" H 2400 4100 50  0000 C CNN
F 3 "" H 2400 4100 50  0000 C CNN
	1    2400 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4100 2400 4050
Wire Wire Line
	2400 3750 2700 3750
Connection ~ 2700 3750
$Comp
L C C606
U 1 1 57EAE85D
P 6650 3100
F 0 "C606" H 6675 3200 50  0000 L CNN
F 1 "1nF" H 6675 3000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6688 2950 50  0001 C CNN
F 3 "" H 6650 3100 50  0000 C CNN
	1    6650 3100
	-1   0    0    1   
$EndComp
$Comp
L C C607
U 1 1 57EAE8CC
P 8550 3750
F 0 "C607" H 8575 3850 50  0000 L CNN
F 1 "1nF" H 8575 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8588 3600 50  0001 C CNN
F 3 "" H 8550 3750 50  0000 C CNN
	1    8550 3750
	1    0    0    -1  
$EndComp
$Comp
L R R605
U 1 1 57EAE910
P 6850 3100
F 0 "R605" V 6930 3100 50  0000 C CNN
F 1 "1k" V 6850 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6780 3100 50  0001 C CNN
F 3 "" H 6850 3100 50  0000 C CNN
	1    6850 3100
	1    0    0    -1  
$EndComp
$Comp
L R R606
U 1 1 57EAE9F7
P 8300 3750
F 0 "R606" V 8380 3750 50  0000 C CNN
F 1 "1k" V 8300 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8230 3750 50  0001 C CNN
F 3 "" H 8300 3750 50  0000 C CNN
	1    8300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2950 6850 2950
Wire Wire Line
	6650 3250 6850 3250
Wire Wire Line
	6850 2950 6850 2900
Connection ~ 7000 2900
Wire Wire Line
	6850 3250 6850 3400
Connection ~ 6850 3400
Wire Wire Line
	8300 3600 8550 3600
Wire Wire Line
	8100 3900 8550 3900
Wire Wire Line
	8300 3600 8300 3400
Connection ~ 8300 3400
Connection ~ 8100 3900
Connection ~ 8300 3900
Wire Wire Line
	6250 4050 6250 4000
Wire Wire Line
	6250 3650 6250 3700
$Comp
L C C608
U 1 1 57F2AC7C
P 3850 3900
F 0 "C608" H 3875 4000 50  0000 L CNN
F 1 "100nF" H 3875 3800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3888 3750 50  0001 C CNN
F 3 "" H 3850 3900 50  0000 C CNN
	1    3850 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3500 3850 3750
Connection ~ 3850 3500
Wire Wire Line
	3850 4050 3850 4350
Connection ~ 3850 4350
Text Notes 8150 4250 0    60   ~ 0
R605 and R606:\n10k and 100pF\nfor more gain
$EndSCHEMATC
