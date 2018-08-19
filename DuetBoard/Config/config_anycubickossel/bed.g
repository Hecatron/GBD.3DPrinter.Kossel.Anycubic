; bed.g
; called to perform automatic delta calibration via G32

M561 ; clear any bed transform
G28  ; home all towers

; Heat bed first
M190 S60

; Move down a bit first since the Z probe speed on Z is a bit slow
G90
G1 Z120

; Probe the bed at 10 peripheral and 6 halfway points, and perform 7-factor auto compensation
; Before running this, you should have set up your Z-probe trigger height to suit your build, in the G31 command in config.g.

G30 P0 X0 Y109.9 H0 Z-99999
G30 P1 X64.6 Y88.91 H0 Z-99999
G30 P2 X104.52 Y33.96 H0 Z-99999
G30 P3 X104.52 Y-33.96 H0 Z-99999
G30 P4 X64.6 Y-88.91 H0 Z-99999
G30 P5 X0 Y-109.9 H0 Z-99999
G30 P6 X-64.6 Y-88.91 H0 Z-99999
G30 P7 X-104.52 Y-33.96 H0 Z-99999
G30 P8 X-104.52 Y33.96 H0 Z-99999
G30 P9 X-64.6 Y88.91 H0 Z-99999
G30 P10 X0 Y54.9 H0 Z-99999
G30 P11 X47.54 Y27.45 H0 Z-99999
G30 P12 X47.54 Y-27.45 H0 Z-99999
G30 P13 X0 Y-54.9 H0 Z-99999
G30 P14 X-47.54 Y-27.45 H0 Z-99999
G30 P15 X-47.54 Y27.45 H0 Z-99999
G30 P16 X0 Y0 H0 Z-99999 S8

; Use S-1 for measurements only, without calculations.
; Use S4 for endstop heights and Z-height only.
; Use S6 for full 6 factors
; If your Z probe has significantly different trigger heights depending on XY position, adjust the H parameters in the G30 commands accordingly.
; The value of each H parameter should be (trigger height at that XY position) - (trigger height at centre of bed)


; Map the bed with a grid of points
G29

; Cool bed
M190 S0

; Save Settings
M500
