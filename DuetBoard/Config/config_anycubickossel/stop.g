; stop.g
; called when M0 (Stop) is run (e.g. when a print from SD card is cancelled)

; Turn off hotend
G10 P0 S0

; Turn off heated bed
M140 S0
