M92 X80 Y80 Z80 E96                                  ; Set steps per mm
1. Measure 200mm, and put a bit of tape on
2. extrude 190mm
3. measure the amount left
4. e.g. 12mm left when it should be 10 means only 188mm has been extruded

(What you asked for / What you actually got) * current E-steps.
190 / 185 * 96 = 98.6 (new steps value)

M92 X80 Y80 Z80 E98.6                                  ; Set steps per mm
