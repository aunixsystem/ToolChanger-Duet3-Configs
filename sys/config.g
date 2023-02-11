; Configuration file for Duet WiFi / Ethernet running RRF3 on E3D Tool Changer
; executed by the firmware on start-up

; General preferences
M111 S0 						; Debugging off
G21 							; Work in millimetres
G90 							; Send absolute coordinates...
M83 							; ...but relative extruder moves
M575 P1 S1 B57600

; Network
M550 P"toolchanger"
M552 I1 S1


M669 K1 						; Select CoreXY mode
G4 S2							; Pause for CAN tools

; Drive direction
M569 P0 S0 						; Drive 0 Z
M569 P1 S0 						; Drive 1 Y
M569 P2 S0 						; Drive 2 X
M569 P3 S0 						; UNUSED
M569 P4 S0 						; UNUSED
M569 P5 S0 						; Drive 5 COUPLER
M569 P20.0 S0 D2				; Drive 20.0 (E0) spreadCycle mode
M569 P21.0 S0 D2 				; Drive 21.0 (E1) spreadCycle mode
M569 P22.0 S0 D2				; Drive 22.0 (E2) spreadCycle mode
M569 P23.0 S0 D2 				; Drive 23.0 (E3) spreadCycle mode

M584 X2 Y1 Z0 C5				; Axis to driver mapping
M584 E20.0:21.0:22.0:23.0		; set extruder drivers

M208 X-35:348.5 Y-49:285 Z0:300 C-45:360	 				; Set axis maxima & minima
M92 X200 Y200 Z1600 C91.022 409:409:409:409				; Set steps per mm assuming x16 microstepping
M350 E16:16:16:16 I1 									; Configure microstepping with interpolation
M350 C16 I10											; Configure microstepping without interpolation
M350 X16 Y16 Z16 I1										; Configure microstepping with interpolation
M566 X400 Y400 Z8 C2 E2:2:2:2							; Set maximum instantaneous speed changes (mm/min)
M203 X35000 Y35000 Z1200 C5000 E5000:5000:5000:5000	; Set maximum speeds (mm/min)
M201 X6000 Y6000 Z400 C500 E2500:2500:2500:2500			; Set accelerations (mm/s^2)
M906 X1800 Y1800 Z1330 I30   						; Idle motion motors to 30%
M906 E1000:1000:1000:1000 C500 I10     						; Idle extruder motors to 10%

; Endstops
M574 X1 Y1 S3 					; Set X / Y endstop stall detection
M574 C0 Z0  						; No C Z endstop

; Z probe
M558 P8 C"io3.in" H3 F1000:300 I0 T30000 	; Set Z probe type to switch, the axes for which it is used and the dive height + speeds
G31 P200 X0 Y0 Z0	 						; Set Z probe trigger value, offset and trigger height
M557 X10:290 Y20:180 S40 					; Define mesh grid

;Stall Detection
M915 X Y S1 F0 H280 R0				; X / Y Axes

; Heaters and temperature sensors
; Bed heater
M308 S0 P"temp0" Y"thermistor" A"Bed Heater" T100000 B4138 C0 	; Set thermistor
M950 H0 C"out0" T0						; Bed heater
M143 H0 S225 							; Set temperature limit for heater 0 to 225C
M307 H0 R0.884 C680.6 D14.38 S1.00 V0 	; Heater 0 tuning results
M140 H0									; Bed heater is heater 0

; Tool 0 heater
M308 S1 P"20.temp0" Y"thermistor" A"T0" T100000 B4725 C7.060000e-8 	; Set thermistor
M950 H1 C"20.out0" T1						; Extruder 0 heater
M143 H1 S300 							; Set temperature limit for heater 1 to 300C

; Tool 1 heater
M308 S2 P"21.temp0" Y"thermistor" A"T1" T100000 B4725 C7.060000e-8 	; Set thermistor
M950 H2 C"21.out0" T2						; Extruder 0 heater
M143 H2 S300 							; Set temperature limit for heater 2 to 300C

; Tool 2 heater
M308 S3 P"22.temp0" Y"thermistor" A"T2" T100000 B4725 C7.060000e-8
M950 H3 C"22.out0" T3
M143 H3 S300 							; Set temperature limit for heater 3 to 300C

; Tool 3 heater
M308 S4 P"23.temp0" Y"thermistor" A"T3" T100000 B4725 C7.060000e-8
M950 H4 C"23.out0" T4
M143 H4 S300 							; Set temperature limit for heater 4 to 300C

; Fans

M950 F1 C"20.out2+out2.tach" 			; Tool 0 hot end fan with tacho
M950 F2 C"20.out1" 						; Tool 0 print cooling fan, no tacho

M950 F3 C"21.out2+out2.tach" 			; Tool 1 hot end fan with tacho
M950 F4 C"21.out1" 						; Tool 1 print cooling fan, no tacho

M950 F5 C"22.out2+out2.tach" 			; Tool 2 hot end fan with tacho
M950 F6 C"22.out1" 						; Tool 2 print cooling fan, no tacho

M950 F7 C"23.out2+out2.tach" 			; Tool 3 hot end fan with tacho
M950 F8 C"23.out1" 						; Tool 3 print cooling fan, no tacho


M106 P1 S255 H1 T50 					; Tool 0 hot end
M106 P2 S0 B0.5							; Tool 0 PCF
M106 P3 S255 H2 T50 					; Tool 1 hot end
M106 P4 S0 B0.5							; Tool 1 PCF
M106 P5 S255 H3 T50 					; Tool 2 hot end
M106 P6 S0 B0.5							; Tool 2 PCF
M106 P7 S255 H4 T50 					; Tool 3 hot end
M106 P8 S0 B0.5							; Tool 3 PCF

; Tools
M563 P0 S"T0" D0 H1 F2 					; Define tool 0
G10 P0 R0 S0 							; Reset initial tool 0 active and standby temperatures to 0C

M563 P1 S"T1" D1 H2 F4 					; Define tool 1
G10 P1 R0 S0 							; Reset initial tool 1 active and standby temperatures to 0C

M563 P2 S"T2" D2 H3 F6 					; Define tool 2
G10 P2 R0 S0 							; Reset initial tool 2 active and standby temperatures to 0C

M563 P3 S"T3" D3 H4 F8 					; Define tool 3 (uses extruder 2 until we have tool 2)
G10 P3 R0 S0 							; Reset initial tool 3 active and standby temperatures to 0C

M593 F50								; cancel ringing at 50Hz (https://forum.e3d-online.com/threads/accelerometer-and-resonance-measurements-of-the-motion-system.3445/)
M376 H15								; bed compensation taper

; PA
M572 D0 S0.05 							; pressure advance T0
M572 D1 S0.05 							; pressure advance T1
M572 D2 S0.05 							; pressure advance T2
M572 D3 S0.05 							; pressure advance T3

; Retraction
M207 S0.45 F3600 T3000  Z0.4

; Accelerometer
M955 P20.0 I10 S1000 R10
M955 P21.0 I10 S1000 R10
M955 P22.0 I10 S1000 R10
M955 P23.0 I10 S1000 R10

G10 P0 X19.72 Y43.79 Z-8.99 C0.00
G10 P1 X19.79 Y43.75 Z-8.89 C0.00
G10 P2 X19.72 Y44.2 Z-9.13 C0.00
G10 P3 X19.44 Y44.02 Z-9.11 C0.00

G29 S2							    	; disable mesh
T-1								      	; deselect tools
M106 P2 S0
M501
