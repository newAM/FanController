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
LIBS:AlexComponents
LIBS:FanController-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 3
Title "Fan Controller"
Date "2018-04-29"
Rev "2"
Comp "Alex M."
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L C C1
U 1 1 57C43FBE
P 3100 6200
F 0 "C1" H 3125 6300 50  0000 L CNN
F 1 "100n" H 3125 6100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3138 6050 50  0001 C CNN
F 3 "" H 3100 6200 50  0000 C CNN
F 4 "1276-1005-1-ND" H 3100 6200 60  0001 C CNN "DigiKey Part Number"
	1    3100 6200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 57C4717D
P 3400 6550
F 0 "#PWR1" H 3400 6300 50  0001 C CNN
F 1 "GND" H 3400 6400 50  0000 C CNN
F 2 "" H 3400 6550 50  0000 C CNN
F 3 "" H 3400 6550 50  0000 C CNN
	1    3400 6550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR2
U 1 1 57C47DEA
P 3700 4900
F 0 "#PWR2" H 3700 4750 50  0001 C CNN
F 1 "+3.3V" H 3700 5040 50  0000 C CNN
F 2 "" H 3700 4900 50  0000 C CNN
F 3 "" H 3700 4900 50  0000 C CNN
	1    3700 4900
	1    0    0    -1  
$EndComp
$Comp
L L_Small L1
U 1 1 57C55489
P 3700 5150
F 0 "L1" H 3730 5190 50  0000 L CNN
F 1 "1uH" V 3650 5050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3700 5150 50  0001 C CNN
F 3 "" H 3700 5150 50  0000 C CNN
F 4 "445-3163-1-ND" H 3700 5150 60  0001 C CNN "DigiKey Part Number"
	1    3700 5150
	1    0    0    -1  
$EndComp
$Comp
L 0813-1X1T-57-F X1
U 1 1 57CC3A1B
P 1350 6050
F 0 "X1" H 800 6900 60  0000 C CNN
F 1 "0813-1X1T-57-F" H 1350 5350 60  0000 C CNN
F 2 "AlexComponents:0813-1X1T-57-F_RJ45-Jack" H 1750 5750 60  0001 C CNN
F 3 "http://belfuse.com/pdfs/0813-1X1T-57-F.pdf" H 1750 5750 60  0001 C CNN
F 4 "507-1421-ND" H 1350 6050 60  0001 C CNN "DigiKey Part Number"
	1    1350 6050
	1    0    0    -1  
$EndComp
$Sheet
S 3100 6900 1350 750 
U 57D5D75D
F0 "PoE_PD_Interface" 60
F1 "PoE_PD_Interface.sch" 60
F2 "VC12" I L 3100 7050 60 
F3 "VC36" I L 3100 7200 60 
F4 "VC45" I L 3100 7350 60 
F5 "VC78" I L 3100 7500 60 
F6 "GND" O R 4450 7500 60 
F7 "3.3V" O R 4450 7100 60 
$EndSheet
$Comp
L GND #PWR4
U 1 1 57D688DE
P 4600 7650
F 0 "#PWR4" H 4600 7400 50  0001 C CNN
F 1 "GND" H 4600 7500 50  0000 C CNN
F 2 "" H 4600 7650 50  0000 C CNN
F 3 "" H 4600 7650 50  0000 C CNN
	1    4600 7650
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 57C43F09
P 2850 5950
F 0 "R4" V 2930 5950 50  0000 C CNN
F 1 "49.9" V 2850 5950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2780 5950 50  0001 C CNN
F 3 "" H 2850 5950 50  0000 C CNN
F 4 "RNCP0805FTD49R9CT-ND" V 2850 5950 60  0001 C CNN "DigiKey Part Number"
	1    2850 5950
	0    -1   -1   0   
$EndComp
$Comp
L +3.3V #PWR3
U 1 1 59EAED8F
P 4600 6900
F 0 "#PWR3" H 4600 6750 50  0001 C CNN
F 1 "+3.3V" H 4600 7040 50  0000 C CNN
F 2 "" H 4600 6900 50  0000 C CNN
F 3 "" H 4600 6900 50  0000 C CNN
	1    4600 6900
	1    0    0    -1  
$EndComp
$Comp
L ATMEGA328P-AU-RESCUE-LoadCell U1
U 1 1 5A35D927
P 9050 5050
F 0 "U1" H 8400 6100 60  0000 C CNN
F 1 "ATMEGA328P-AU" H 9100 3800 60  0000 C CNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 8800 5250 60  0001 C CNN
F 3 "http://www.atmel.com/images/Atmel-8271-8-bit-AVR-Microcontroller-ATmega48A-48PA-88A-88PA-168A-168PA-328-328P_datasheet_Complete.pdf" H 8800 5250 60  0001 C CNN
F 4 "ATMEGA328P-AU-ND" H 8500 6250 60  0001 C CNN "DigiKey Part Number"
	1    9050 5050
	1    0    0    -1  
$EndComp
NoConn ~ 8150 5700
NoConn ~ 8150 5800
$Comp
L Resonator-RESCUE-LoadCell Y1
U 1 1 5A35F17B
P 7850 5300
F 0 "Y1" H 7850 5450 60  0000 C CNN
F 1 "8MHz" V 8000 5450 60  0000 C CNN
F 2 "AlexComponents:CERALOCK_CSTCE_Resonator" H 7850 5300 60  0001 C CNN
F 3 "http://www.murata.com/~/media/webrenewal/support/library/catalog/products/timingdevice/ceralock/p16e.ashx" H 7850 5300 60  0001 C CNN
F 4 "490-1195-1-ND" H 7850 5300 60  0001 C CNN "DigiKey Part Number"
	1    7850 5300
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 5A36021D
P 3400 6200
F 0 "C2" H 3425 6300 50  0000 L CNN
F 1 "100n" H 3425 6100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3438 6050 50  0001 C CNN
F 3 "" H 3400 6200 50  0000 C CNN
F 4 "1276-1005-1-ND" H 3400 6200 60  0001 C CNN "DigiKey Part Number"
	1    3400 6200
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A360407
P 2850 5750
F 0 "R3" V 2930 5750 50  0000 C CNN
F 1 "49.9" V 2850 5750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2780 5750 50  0001 C CNN
F 3 "" H 2850 5750 50  0000 C CNN
F 4 "RNCP0805FTD49R9CT-ND" V 2850 5750 60  0001 C CNN "DigiKey Part Number"
	1    2850 5750
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 5A360473
P 2850 5550
F 0 "R2" V 2930 5550 50  0000 C CNN
F 1 "49.9" V 2850 5550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2780 5550 50  0001 C CNN
F 3 "" H 2850 5550 50  0000 C CNN
F 4 "RNCP0805FTD49R9CT-ND" V 2850 5550 60  0001 C CNN "DigiKey Part Number"
	1    2850 5550
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 5A3604DE
P 2850 5350
F 0 "R1" V 2930 5350 50  0000 C CNN
F 1 "49.9" V 2850 5350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2780 5350 50  0001 C CNN
F 3 "" H 2850 5350 50  0000 C CNN
F 4 "RNCP0805FTD49R9CT-ND" V 2850 5350 60  0001 C CNN "DigiKey Part Number"
	1    2850 5350
	0    -1   -1   0   
$EndComp
$Comp
L C C5
U 1 1 5A360882
P 7700 4750
F 0 "C5" H 7725 4850 50  0000 L CNN
F 1 "100n" H 7725 4650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7738 4600 50  0001 C CNN
F 3 "" H 7700 4750 50  0000 C CNN
F 4 "1276-1005-1-ND" H 7700 4750 60  0001 C CNN "DigiKey Part Number"
	1    7700 4750
	1    0    0    -1  
$EndComp
Text GLabel 4650 4000 2    60   Input ~ 0
SCK
Text GLabel 4650 4150 2    60   Input ~ 0
SS
Text GLabel 4650 4300 2    60   Input ~ 0
MOSI
Text GLabel 4650 4450 2    60   Output ~ 0
MISO
$Comp
L R R7
U 1 1 5A3653BC
P 7800 4100
F 0 "R7" V 7880 4100 50  0000 C CNN
F 1 "12k" V 7800 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 7730 4100 50  0001 C CNN
F 3 "" H 7800 4100 50  0000 C CNN
F 4 "311-12.0KHRCT-ND" V 7800 4100 60  0001 C CNN "DigiKey Part Number"
F 5 "1%" V 7800 4100 60  0001 C CNN "Tolerance"
	1    7800 4100
	0    -1   -1   0   
$EndComp
$Comp
L C C4
U 1 1 5A370DB4
P 7400 4750
F 0 "C4" H 7425 4850 50  0000 L CNN
F 1 "100n" H 7425 4650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 7438 4600 50  0001 C CNN
F 3 "" H 7400 4750 50  0000 C CNN
F 4 "1276-1005-1-ND" H 7400 4750 60  0001 C CNN "DigiKey Part Number"
	1    7400 4750
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR7
U 1 1 5A37156F
P 7400 3900
F 0 "#PWR7" H 7400 3750 50  0001 C CNN
F 1 "+3.3V" H 7400 4040 50  0000 C CNN
F 2 "" H 7400 3900 50  0000 C CNN
F 3 "" H 7400 3900 50  0000 C CNN
	1    7400 3900
	1    0    0    -1  
$EndComp
Text GLabel 7950 3900 0    60   Input ~ 0
RST
$Comp
L GND #PWR8
U 1 1 5A372950
P 7400 6400
F 0 "#PWR8" H 7400 6150 50  0001 C CNN
F 1 "GND" H 7400 6250 50  0000 C CNN
F 2 "" H 7400 6400 50  0000 C CNN
F 3 "" H 7400 6400 50  0000 C CNN
	1    7400 6400
	1    0    0    -1  
$EndComp
NoConn ~ 9900 4100
NoConn ~ 9900 4200
Text GLabel 10100 4300 2    60   Output ~ 0
SS
Text GLabel 10100 4400 2    60   BiDi ~ 0
MOSI
Text GLabel 10100 4500 2    60   BiDi ~ 0
MISO
Text GLabel 10100 4600 2    60   BiDi ~ 0
SCK
$Comp
L CONN_02X03 X2
U 1 1 5A3A990F
P 9000 2750
F 0 "X2" H 9000 2950 50  0000 C CNN
F 1 "ICSP" H 9000 2550 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 9000 1550 50  0001 C CNN
F 3 "" H 9000 1550 50  0000 C CNN
	1    9000 2750
	1    0    0    -1  
$EndComp
Text GLabel 8650 2650 0    60   Input ~ 0
MISO
Text GLabel 9350 2750 2    60   Output ~ 0
MOSI
Text GLabel 8650 2750 0    60   Output ~ 0
SCK
Text GLabel 8650 2850 0    60   Input ~ 0
RST
$Comp
L GND #PWR12
U 1 1 5A3AFF62
P 9350 2950
F 0 "#PWR12" H 9350 2700 50  0001 C CNN
F 1 "GND" H 9350 2800 50  0000 C CNN
F 2 "" H 9350 2950 50  0000 C CNN
F 3 "" H 9350 2950 50  0000 C CNN
	1    9350 2950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR11
U 1 1 5A3B0018
P 9350 2600
F 0 "#PWR11" H 9350 2450 50  0001 C CNN
F 1 "+3.3V" H 9350 2740 50  0000 C CNN
F 2 "" H 9350 2600 50  0000 C CNN
F 3 "" H 9350 2600 50  0000 C CNN
	1    9350 2600
	1    0    0    -1  
$EndComp
$Sheet
S 3100 3850 1350 750 
U 5A3B29AF
F0 "W5100_Ethernet_Interface" 60
F1 "W5100_Ethernet_Interface.sch" 60
F2 "RD+" I L 3100 4300 60 
F3 "RD-" I L 3100 4450 60 
F4 "SCK" I R 4450 4000 60 
F5 "SS" I R 4450 4150 60 
F6 "MOSI" I R 4450 4300 60 
F7 "MISO" O R 4450 4450 60 
F8 "TD+" I L 3100 4000 60 
F9 "TD-" I L 3100 4150 60 
$EndSheet
$Comp
L C C3
U 1 1 5A8A17BE
P 3700 6200
F 0 "C3" H 3725 6300 50  0000 L CNN
F 1 "100n" H 3725 6100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 3738 6050 50  0001 C CNN
F 3 "" H 3700 6200 50  0000 C CNN
F 4 "1276-1005-1-ND" H 3700 6200 60  0001 C CNN "DigiKey Part Number"
	1    3700 6200
	1    0    0    -1  
$EndComp
Text Label 2700 4000 0    60   ~ 0
TD+
Text Label 2700 4150 0    60   ~ 0
TD-
Text Label 2700 4300 0    60   ~ 0
RD+
Text Label 2700 4450 0    60   ~ 0
RD-
$Comp
L Conn_01x06 X3
U 1 1 5A8A6A3D
P 9350 1300
F 0 "X3" H 9350 1600 50  0000 C CNN
F 1 "Serial Interface" H 9350 900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x06_Pitch2.54mm" H 9350 1300 50  0001 C CNN
F 3 "" H 9350 1300 50  0001 C CNN
	1    9350 1300
	1    0    0    -1  
$EndComp
Text GLabel 8900 1400 0    60   Input ~ 0
RXI
Text GLabel 8900 1500 0    60   Output ~ 0
TXO
Text GLabel 8900 1600 0    60   Input ~ 0
DTR
Text GLabel 10100 5500 2    60   Input ~ 0
RXI
Text GLabel 10100 5600 2    60   Output ~ 0
TXO
NoConn ~ 9900 5700
NoConn ~ 9900 6200
NoConn ~ 9900 5100
NoConn ~ 9900 5000
NoConn ~ 9900 4900
NoConn ~ 9900 4800
$Comp
L +3.3V #PWR10
U 1 1 5A8AA26D
P 8800 850
F 0 "#PWR10" H 8800 700 50  0001 C CNN
F 1 "+3.3V" H 8800 990 50  0000 C CNN
F 2 "" H 8800 850 50  0000 C CNN
F 3 "" H 8800 850 50  0000 C CNN
	1    8800 850 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR9
U 1 1 5A8AA60D
P 8500 1750
F 0 "#PWR9" H 8500 1500 50  0001 C CNN
F 1 "GND" H 8500 1600 50  0000 C CNN
F 2 "" H 8500 1750 50  0000 C CNN
F 3 "" H 8500 1750 50  0000 C CNN
	1    8500 1750
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 5A8ABC23
P 8050 3650
F 0 "C6" H 8075 3750 50  0000 L CNN
F 1 "100n" H 8075 3550 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603" H 8088 3500 50  0001 C CNN
F 3 "" H 8050 3650 50  0000 C CNN
F 4 "1276-1005-1-ND" H 8050 3650 60  0001 C CNN "DigiKey Part Number"
	1    8050 3650
	1    0    0    -1  
$EndComp
Text GLabel 7950 3400 0    60   Input ~ 0
DTR
NoConn ~ 9900 5900
NoConn ~ 9900 5800
$Comp
L Q_NPN_BEC Q1
U 1 1 5AADB720
P 5300 2300
F 0 "Q1" H 5500 2350 50  0000 L CNN
F 1 "Q_NPN_BEC" H 5500 2250 50  0001 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 5500 2400 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/MMBT3904LT1-D.PDF" H 5300 2300 50  0001 C CNN
F 4 "MMBT3904LT1GOSCT-ND" H 5300 2300 60  0001 C CNN "DigiKey Part Number"
	1    5300 2300
	1    0    0    -1  
$EndComp
$Comp
L LED_ALT D1
U 1 1 5AADB99B
P 5400 1750
F 0 "D1" H 5400 1850 50  0000 C CNN
F 1 "IR" H 5400 1650 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm" H 5400 1750 50  0001 C CNN
F 3 "" H 5400 1750 50  0001 C CNN
	1    5400 1750
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 5AADC054
P 5400 1250
F 0 "R6" V 5480 1250 50  0000 C CNN
F 1 "10" V 5400 1250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 5330 1250 50  0001 C CNN
F 3 "" H 5400 1250 50  0000 C CNN
F 4 "RNCP0805FTD10R0CT-ND" V 5400 1250 60  0001 C CNN "DigiKey Part Number"
	1    5400 1250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR5
U 1 1 5AADC667
P 5400 900
F 0 "#PWR5" H 5400 750 50  0001 C CNN
F 1 "+3.3V" H 5400 1040 50  0000 C CNN
F 2 "" H 5400 900 50  0000 C CNN
F 3 "" H 5400 900 50  0000 C CNN
	1    5400 900 
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5AADD722
P 4750 2300
F 0 "R5" V 4830 2300 50  0000 C CNN
F 1 "150" V 4750 2300 50  0000 C CNN
F 2 "Resistors_SMD:R_0603" V 4680 2300 50  0001 C CNN
F 3 "" H 4750 2300 50  0000 C CNN
F 4 "311-150HRCT-ND" V 4750 2300 60  0001 C CNN "DigiKey Part Number"
F 5 "1%" V 4750 2300 60  0001 C CNN "Tolerance"
	1    4750 2300
	0    -1   -1   0   
$EndComp
Text GLabel 10100 6000 2    60   Output ~ 0
PD5
Text GLabel 4400 2300 0    60   Input ~ 0
PD5
NoConn ~ 9900 6100
$Comp
L GND #PWR6
U 1 1 5AADFDA6
P 5400 2700
F 0 "#PWR6" H 5400 2450 50  0001 C CNN
F 1 "GND" H 5400 2550 50  0000 C CNN
F 2 "" H 5400 2700 50  0000 C CNN
F 3 "" H 5400 2700 50  0000 C CNN
	1    5400 2700
	1    0    0    -1  
$EndComp
Text GLabel 10100 5300 2    60   BiDi ~ 0
SCL
Text GLabel 10100 5200 2    60   BiDi ~ 0
SDA
Wire Wire Line
	3000 5950 3100 5950
Wire Wire Line
	3100 5750 3100 6050
Wire Wire Line
	3100 5750 3000 5750
Connection ~ 3100 5950
Wire Wire Line
	3000 5350 3400 5350
Wire Wire Line
	3100 6350 3100 6450
Wire Wire Line
	2600 7050 3100 7050
Wire Wire Line
	2500 7200 3100 7200
Wire Wire Line
	2400 7350 3100 7350
Wire Wire Line
	2300 7500 3100 7500
Wire Wire Line
	4450 7500 4600 7500
Wire Wire Line
	4600 7500 4600 7650
Connection ~ 2300 5350
Connection ~ 2400 5550
Connection ~ 2500 5750
Connection ~ 2600 5950
Wire Wire Line
	2200 5350 2700 5350
Wire Wire Line
	2200 5550 2700 5550
Wire Wire Line
	2200 5750 2700 5750
Wire Wire Line
	2200 5950 2700 5950
Wire Wire Line
	2600 7050 2600 6050
Wire Wire Line
	2600 6050 2200 6050
Wire Wire Line
	2500 7200 2500 6150
Wire Wire Line
	2500 6150 2200 6150
Wire Wire Line
	2400 7350 2400 6250
Wire Wire Line
	2400 6250 2200 6250
Wire Wire Line
	2300 7500 2300 6350
Wire Wire Line
	2300 6350 2200 6350
Wire Wire Line
	3000 5550 3400 5550
Connection ~ 3400 5550
Wire Wire Line
	3100 6450 3700 6450
Wire Wire Line
	3400 6350 3400 6550
Connection ~ 3400 6450
Wire Wire Line
	4600 6900 4600 7100
Wire Wire Line
	4600 7100 4450 7100
Wire Wire Line
	2300 4000 2300 5350
Wire Wire Line
	2500 4300 2500 5750
Wire Wire Line
	2600 4450 2600 5950
Wire Wire Line
	2400 4150 2400 5550
Wire Wire Line
	8150 5500 7850 5500
Wire Wire Line
	7850 5100 8150 5100
Wire Wire Line
	7950 4100 8150 4100
Wire Wire Line
	8050 4700 8150 4700
Wire Wire Line
	8050 4300 8050 4700
Wire Wire Line
	7400 4300 8150 4300
Wire Wire Line
	8150 4400 8050 4400
Connection ~ 8050 4400
Wire Wire Line
	8150 4500 8050 4500
Connection ~ 8050 4500
Wire Wire Line
	7650 4100 7400 4100
Wire Wire Line
	7400 3900 7400 4600
Wire Wire Line
	7400 5300 7600 5300
Wire Wire Line
	7400 4900 7400 6400
Wire Wire Line
	7700 4900 7700 5000
Wire Wire Line
	7700 5000 7400 5000
Connection ~ 7400 5000
Wire Wire Line
	7700 4600 7700 4300
Connection ~ 8050 4300
Connection ~ 7400 4300
Connection ~ 7700 4300
Connection ~ 7400 4100
Wire Wire Line
	7950 3900 8050 3900
Wire Wire Line
	8050 3800 8050 4100
Connection ~ 8050 4100
Wire Wire Line
	7400 6000 8150 6000
Connection ~ 7400 5300
Wire Wire Line
	7400 6100 8150 6100
Connection ~ 7400 6000
Wire Wire Line
	7400 6200 8150 6200
Connection ~ 7400 6100
Connection ~ 7400 6200
Wire Wire Line
	9900 4300 10100 4300
Wire Wire Line
	9900 4400 10100 4400
Wire Wire Line
	9900 4500 10100 4500
Wire Wire Line
	9900 4600 10100 4600
Wire Wire Line
	8650 2650 8750 2650
Wire Wire Line
	9250 2750 9350 2750
Wire Wire Line
	8650 2750 8750 2750
Wire Wire Line
	8650 2850 8750 2850
Wire Wire Line
	9250 2650 9350 2650
Wire Wire Line
	9350 2650 9350 2600
Wire Wire Line
	9250 2850 9350 2850
Wire Wire Line
	9350 2850 9350 2950
Wire Wire Line
	4450 4450 4650 4450
Wire Wire Line
	4450 4300 4650 4300
Wire Wire Line
	4450 4150 4650 4150
Wire Wire Line
	4450 4000 4650 4000
Wire Wire Line
	3100 4000 2300 4000
Wire Wire Line
	2600 4450 3100 4450
Wire Wire Line
	2500 4300 3100 4300
Wire Wire Line
	2400 4150 3100 4150
Wire Wire Line
	3400 5350 3400 6050
Wire Wire Line
	3700 6450 3700 6350
Wire Wire Line
	2200 5450 3700 5450
Wire Wire Line
	3700 5250 3700 6050
Connection ~ 3700 5450
Wire Wire Line
	3700 5050 3700 4900
Wire Wire Line
	8900 1400 9150 1400
Wire Wire Line
	8900 1500 9150 1500
Wire Wire Line
	8900 1600 9150 1600
Wire Wire Line
	9900 5500 10100 5500
Wire Wire Line
	9900 5600 10100 5600
Wire Wire Line
	9150 1300 8800 1300
Wire Wire Line
	8800 1300 8800 850 
Wire Wire Line
	9150 1200 8500 1200
Wire Wire Line
	9150 1100 8500 1100
Connection ~ 8500 1200
Wire Wire Line
	8500 1100 8500 1750
Wire Wire Line
	8050 3400 8050 3500
Connection ~ 8050 3900
Wire Wire Line
	7950 3400 8050 3400
Wire Wire Line
	9900 6000 10100 6000
Wire Wire Line
	5400 1100 5400 900 
Wire Wire Line
	5400 2100 5400 1900
Wire Wire Line
	5400 1600 5400 1400
Wire Wire Line
	4400 2300 4600 2300
Wire Wire Line
	4900 2300 5100 2300
Wire Wire Line
	5400 2700 5400 2500
Wire Wire Line
	9900 5200 10100 5200
Wire Wire Line
	9900 5300 10100 5300
$EndSCHEMATC
