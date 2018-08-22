PID tuning bed

run the tuning
M303 H0 P1 S80

store settings to config-overide.g where we can copy them out
M500


show the tuning values
M303 H0

set tuning values in config.g
M307 H1 A188.4, C121.7, D1.4 S0.5



PID tunning hotend

run the tuning
M303 H1 P0.5 S230

store settings to config-overide.g where we can copy them out
M500


show the tuning values
M303 H1

set tuning values in config.g
M307 H1 A188.4, C121.7, D1.4 S0.5




Adjust the P setting (PWM) so that its as high as possible, but at the same time not too high
to high and it will overshoot / be overpowered
to low and it will take a long time to heat up

P0.5 has problems reaching 230 degrees
P0.6 seems to be a good value for mine

to prevent oscilation, try increasing the dead time
https://forum.duet3d.com/topic/5778/e3dv6-tuning/3

D6 seems like a good value

this seems to work best
M307 H1 A253.8 C118.5 D6 S0.50 V12.0 B0


results:

M303 H1 P1 S200
Auto tune phase 3, peak temperature was 204.7
Warning: Heater 1 appears to be over-powered. If left on at full power, its temperature is predicted to reach 470C.

M303 H1 P0.5 S230
Auto tune phase 3, peak temperature was 200.8

M303 H1 P0.6 S230
Auto tune phase 3, peak temperature was 201.6
Auto tune phase 3, peak temperature was 231.2

M307 H1 A255.6 C120.9 D6 S0.50 V12.0 B0

200.3 199.4
200.2 199.6



M307 H1 A253.8 C118.5 D1.6 S0.60 V12.0 B0



198.3 200.5


the results are different while printing
influenced by speed of printing and if the part fan is on
add a note about putting the part fan on before running the pid calibration

0.55 pmw seems okay but dips a bit during printing 
M303 H1 P0.55 S230

0.9 seems to be okay without warnings
M303 H1 P0.9 S190
