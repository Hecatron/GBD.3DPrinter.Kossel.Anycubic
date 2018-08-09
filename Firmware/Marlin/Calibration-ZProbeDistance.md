# Z Probe Offset Calibration

The Z Probe Offset setting represents the distance difference between the end of the nozzel and the Probe Switch
Normally the probe should have a fixed distance for the V1 for example it's usually 19.00mm

However if the nozzel has been replaced or is slightly higher or lower
or if the probe is slighlty off then it can be useful to calibrate this setting manually as well.


## The paper method

The paper method which is quite common involves the following to determine the Z offset

  * Make sure the probe is not fitted.
  * Put a sheet of paper on the bed
  * Measure paper thickness with calipers
  * Prepare -> Move Axis -> Move Z
  * Move the Z down until the paper is just resisting
    (for example scratchy at 1.7, stuck at 1.8, space at 1.6, z offset used of -1.65)
  

## The electrical method

TODO


## Set the Z Offset

The first place to store the Z offset is

  * Control -> Motion -> Z Offset

Next we need to re-set the Delta Height
we can ether manually remove the offset from the Height in the Delta Calibration settings
or run with the probe attached

  * Prepare -> Delta Calibration -> Set Delta Height <br>
    GCode G33 P1

For example if the existing Z Offset was -14.9 <br>
-14.9 + -1.65 = -16.55

The idea is that when the z axis is at 0 the paper should be just about catching.


## Store Settings

  * TODO
  * Delta Calibration -> Store Settings
