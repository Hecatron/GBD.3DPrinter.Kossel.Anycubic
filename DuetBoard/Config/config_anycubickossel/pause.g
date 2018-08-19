; Pause macro file
; called when a print from SD card is paused

M83                     ; relative extruder moves
G1 E-3 F2500            ; retract 3mm of filament
G91                     ; relative moves
G1 Z20 F360             ; lift Z by 20mm
G90                     ; absolute moves
G1 X0 Y0 F5000          ; move head out of the way of the print
