; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up

; General preferences
G21                                                  ; Work in millimetres
G90                                                  ; Send absolute coordinates...
M83                                                  ; ...but relative extruder moves

;*** The homed height is deliberately set too high in the following - you will adjust it during calibration.
M665 R134.4 L271.5 B116 H300                       ; Set delta radius, diagonal rod length, printable radius and homed height
M666 X0 Y0 Z0                                        ; Put your endstop adjustments here, or let auto calibration find them

; Network
M111 S0                                              ; Debug off
M550 PAnycubic1                                      ; Set machine name
M587 S"************" P"**************"               ; Configure access point.
M552 S1                                              ; Enable network
M586 P0 S1                                           ; Enable HTTP
M586 P1 S0                                           ; Disable FTP
M586 P2 S0                                           ; Disable Telnet
M555 P2	                                             ; Set output to look like Marlin

; Drives
M569 P0 S1                                           ; Drive 0 goes forwards
M569 P1 S1                                           ; Drive 1 goes forwards
M569 P2 S1                                           ; Drive 2 goes forwards
M569 P3 S1                                           ; Drive 3 goes forwards
M350 X16 Y16 Z16 E16 I1                              ; Configure microstepping with interpolation
M92 X80 Y80 Z80 E98.6                                ; Set steps per mm
M566 X300 Y300 Z300 E300                             ; Set maximum instantaneous speed changes (mm/min) / Jerk values
;M203 X12000 Y12000 Z12000 E3000                     ; Set maximum speeds 12000 (mm/min) / 200 (mm/sec) - Todo Optimum speeds
M203 X6000 Y6000 Z6000 E1000                         ; Set maximum speeds 12000 (mm/min) / 200 (mm/sec) - testing
;M203 X100 Y100 Z100 E100                         ; Set maximum speeds 12000 (mm/min) / 200 (mm/sec) - testing
M201 X2000 Y2000 Z2000 E2000                         ; Set accelerations (mm/s^2)
;M906 X1200 Y1200 Z1200 E1200 I30                    ; Set motor currents (mA) and motor idle factor in per cent
M906 X1000 Y1000 Z1000 E1000 I30                     ; Set motor currents (mA) and increase idle current to 30%
M84 S30                                              ; Set idle timeout

; Axis Limits
M208 Z0 S1                                           ; Set minimum Z

; Endstops
M574 X2 Y2 Z2 S1                                     ; Set active high endstops

; Probe v1 (broken) = 16.2, (good) = 19.0 (inverted)
; Probe v2 (good)   = 16.695

; Z-Probe
;M558 P4 R0.4 H3 F300 T3000 I1                         ; Use E0 end stop for probe - Probe V1
M558 P4 R0.4 H3 F300 T1000                            ; Use E0 end stop for probe - Probe V2

;G31 P100 X0 Y0 Z16.2                                 ; Set Z probe trigger value, offset and trigger height - Probe V1
G31 P100 X0 Y0 Z16.695                                ; Set Z probe trigger value, offset and trigger height - Probe V2
M557 R110 S20                                        ; Define mesh grid

; Heaters
M305 P0 T100000 B4267 C0 R4700                       ; Set thermistor + ADC parameters for heater 0
M143 H0 S120                                         ; Set temperature limit for heater 0 to 120C
M305 P1 T100000 B4267 C0 R4700                       ; Set thermistor + ADC parameters for heater 1
M143 H1 S275                                         ; Set temperature limit for heater 1 to 275C

; Heater Timeout
M570 S180                                            ; Hot end may be a little slow to heat up so allow it 180 seconds

; Fans
; Controller Fan hooked up to always on Fan
; 31Hz seems to generate less buzz during pwm
; Full on after 60 degrees
M106 P0 S0 I0 F31 H-1 B1 CPartFan1                   ; Used to cool the part
;M106 P1 S0 I0 F31 H-1                               ; Spare
M106 P2 S0 I0 F31 H1 L1 T60 CHotendFan1              ; Used to cool the hotend

; Tools
M563 P0 D0 H1                                        ; Define tool 0
G10 P0 X0 Y0 Z0                                      ; Set tool 0 axis offsets
G10 P0 R0 S0                                         ; Set initial tool 0 active and standby temperatures to 0C

; Automatic power saving
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"   ; Set voltage thresholds and actions to run on power loss

; Custom settings

; Miscellaneous
T0                                                   ; Select first tool


; Load settings from config-overide.g
; typically those auto calibrated
M501

; Load G29 bed leveling file
G29 S1

; Note with my current bed a ultrabase, the delta height should be around
; M665 H290.156
; within config-override after a auto calibration / M500 save
