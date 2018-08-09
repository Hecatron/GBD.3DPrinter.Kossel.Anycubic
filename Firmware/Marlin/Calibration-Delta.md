# Delta Calibration

Next we're going to run delta auto calibration
this will use the probe 

  * https://hennerley.wordpress.com/2018/01/29/g29-vs-g33/
  * https://www.youtube.com/watch?v=U20_2BkuD4g
  * https://github.com/FLSun3dp/FLSun-Kossel-Mini/wiki/07.-G33-Auto-Calibration
  * http://marlinfw.org/docs/gcode/G033.html
  * https://www.thingiverse.com/thing:2256557

G29 is the traditional auto bed level which is sort of a fudge factor for unlevel beds
it can also compensate for non-calibrated delta machines
however using that can add overhead to the calculations needed on the board

it's best instead to use G33 to do delta calibration first
this works out the subtle differences in the angles of the towers and other parameters
assuming the bed is actually flat / level.

G29 can then be used after the calibration if the bed is uneven for any reason.
Note the Z Probe Offset (distance between the nozzel and probe switch)
doesn't need to be accurate for G33 to work so that can be done afterwards, but it may be need to be done before G29

## Testing the probe sensor

One thing we can do is test the probe sensor
by running the M119 command
then looking for the z_min

it should be listed as open for when the switch is not triggered, and TRIGGERED for when it's pushed in


## Running the initial delta calibration

We can see the current delta calibration settings under

  * Prepare -> Delta Calibration -> Delta Settings

The DiagRod setting is the length of the rod from the tower to the effector
so this won't change automatically.

Next we run the autocalibration (from ether the LCD menu or via G-Code)

  * Prepare -> Delta Calibration -> Auto Calibration <br>
    GCode G33
  * Prepare -> Delta Calibration -> Set Delta Height <br>
    GCode G33 P1

This should set

  * Height
  * EndStop measurements: Ex, Ey, Ez
  * Radius
  * Tower Angles: Tx, Ty, Tz


### Adjust end stop screws

Ideally we should try to get the E values all zero if possible or all the same
this can be done by adjusting the end stop screws

Example: mine after calibation

Calibration OK
Height:291.86
Ex:-1.24
Ey:-3.91
Ez:+0.00
Radius:134.32
Tx:-0.14
Ty:+0.17
Tz:-0.03
Save with M500 and/or copy to Configuration.h

### Store Settings

Finally we can store the settings via

  * Delta Calibration -> Store Settings





