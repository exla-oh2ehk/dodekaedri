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
Sheet 1 4
Title "Block layer"
Date "2016-09-20"
Rev "0.1"
Comp "PRK - OH2TI"
Comment1 "exla - OH2EHK"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8500 2400 1450 1050
U 57E30E5C
F0 "Frequency synthesizer" 60
F1 "freq_synth.sch" 60
$EndSheet
$Sheet
S 3800 2200 1350 950 
U 57E31F2A
F0 "antenna_block" 60
F1 "antenna_block.sch" 60
$EndSheet
$Sheet
S 5450 4400 1400 950 
U 57E31551
F0 "PSU" 60
F1 "psu.sch" 60
F2 "Vlogic_OUT" O R 6850 4650 60 
$EndSheet
$Comp
L +Vlogic #PWR?
U 1 1 57E3367B
P 7200 4600
F 0 "#PWR?" H 7200 4400 50  0001 C CNN
F 1 "+Vlogic" H 7200 4800 50  0000 C CNN
F 2 "" H 7200 4600 50  0000 C CNN
F 3 "" H 7200 4600 50  0000 C CNN
	1    7200 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 4650 7200 4650
Wire Wire Line
	7200 4650 7200 4600
$EndSCHEMATC
