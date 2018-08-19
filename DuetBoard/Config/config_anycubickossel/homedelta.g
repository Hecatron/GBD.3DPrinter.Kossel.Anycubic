; homedelta.g
; called to home all towers on a delta printer

G91                       ; relative positioning

; first pass - move all towers to the high end stopping at the endstops
G1 S1 X400 Y400 Z400 F1800

; Go down a few mm
G1 S2 X-5 Y-5 Z-5 F200

; Move each tower up
G1 S1 X10 F200
G1 S1 Y10 F200
G1 S1 Z10 F200

; For G30 leveling to work, we need to leave the position at where the end stops trigger
;G1 S1 X10 Y10 Z10 F200    ; move all towers up once more (second pass)
;G1 Z-5 F200              ; move down a few mm so that the nozzle can be centred
G90                       ; absolute positioning
;G1 X0 Y0 F200            ; move X+Y to the centre
