# Duet Board Bed Leveling

With the duet board there are two forms of leveling

  * G30 - Tries to calculate the bed tilt / other parameters to compensate
  * G29 - Uses a grid of points for more traditional bed leveling for uneven beds

## Checking the Probe Offset

First its best to reduce the Feed / Travel speed of the probe in case something unexpected happens
This is the F and T parameters of the M558 command

```
M558 P4 R0.4 H3 F300 T300 I1
```

In order to check the probe offset

  * Attach the Probe
  * Home the machine
  * issue the command "M208 S1 Z-3"
    This should allow the head to travel down further than 0 by 3mm
  * Issue the command "G30"
    This will probe the center of the bed and set the 0 point based on the probe height.

  * Remove the Probe
  * Put a piece of paper under the nozzel
  * Gradually move the head down untill it's just above gripping the paper
  * Make a note of the Z value

In theory the Z value at this stage should be 0.1, if it isn't then we need to alter the Z Probe offset
The Z Probe offset is set via G31

```
G31 P100 X0 Y0 Z16.2
```

Note its also possible to use:
G30 S-1 to probe, then read off the Z height.


## Automated Leveling / G32

By issuing the **G32** command, or selecting **Auto Delta Calibration** on the main menu
this will trigger the commands within bed.g to be run
so G32 can be thought of as a overall do the bed leveling without specifying any parameters
with all the parameters being within the **bed.g** file such as Homing / G30 commands / G29 commands


### G30 Bed Leveling

Unlike traditional bed leveling, G30 attepts to work out calibration issues of the printer
such as

  * tilt of the bed
  * different heights of the end stops
  * angle of the towers

The way I do this within **bed.g**

  * Home the machine
  * move the ged down to about 120mm
  * run a single G30 command (no parameters) over the center to set the height of the machine (sets Z = 0 based on the probe height)
  * run a series of G30 commands to probe the bed
  * run G30 P16 X0 Y0 H0 Z-99999 S7

The default in the configuration is 7 factor leveling for the last line.
I've upped this to 9 factor to see how this works


#### Saving G30 Settings

We can save the settings for the G30 Bed leveling by using **M500**
This will save the settings to a file called **config-overide.g**
Note in order for these to be used, there needs to be a M501 command at the bottom of **config.g**

Typically these will show up under M665 which is the delta parameters.
And M666 which is end stop position corrections / tilt corrections.
Normally these are set to an approximate best guess value within config.g, but are then overriden by these values
within **config-override.g** which is from the automated calibration.

Typically for 7 factor calibration
```
M665 L272.251 R134.654 H295.189 B116.0 X0.238 Y0.543 Z0.000
M666 X-0.487 Y0.170 Z0.317 A0.00 B0.00
```

### G29 Bed Leveling

  * https://duet3d.dozuki.com/Wiki/Using_mesh_bed_compensation

G29 Bed leveling is the more traditional form of leveling.
This probes multiple points on the bed in the form of a grid and generates a heat map
which can be seen within the GUI

The G30 commands will always wipe out the G29 bed leveling information in memory
so if using G29 it should be done after G30 has been run

When running G29 on it's own with no parameters it should automatically save the results to
/sys/heightmap.csv

   * G29 S0 - run and save (default)
   * G29 S1 - load from file and activate
   * G29 S2 - clear bed height map
   * M561 - turn off bed compensation

The P option can be used with S0 or S1 to specify a different file


set 16.8
measured +0.3

set 17.1
measured +0.7

set 16.6
measured +0.1



## Delta Height

Hi,
Theres a couple of things I've spotted recently
This is to do with the calibration of a delta printer and perhaps some changes to the default config files

I'm using an Anycubic Kossel Linear Plus, Duet Wifi, latest firmware 2.01
The printer has a magnetic probe that clips directly underneath the nozzel at around 16.6mm dowards on the Z axis

the config files I'm using can be seen here
  * https://github.com/grbd/GBD.3DPrinter.Kossel.Anycubic/tree/master/DuetBoard/Config/configv2

## Delta Height

The first thing I've spotted which is quite important relates to the delta height
It might ether be a case of an error in my G-Code, or possibly a software bug, or maybe a missing feature I'm not sure
But I think the G30 autocalibration doesn't set the overall delta height automatically in relation to the end stops
Then again perhaps it's not designed to do that.

  * https://duet3d.dozuki.com/Wiki/Calibrating_a_delta_printer#Section_M665_command

This seems to suggest that you should get the delta height within 5mm of the bed before starting the calibration
so perhaps this is where I was going wrong

First as a starting point I used the following to setup the delta parameters
```
M665 R134.4 L271.5 B116 H300
M666 X0 Y0 Z0
```
Now the delta height is actually around 289.877 instead of 300 for info
If I run the auto-calibration / G32, then the end result will look something like
```
Diagonal 272.463, delta radius 134.676, homed height 299.998, bed radius 116.0, X 0.652°, Y 0.751°, Z 0.000°
```
This is still close to 300mm the original value
I think it's adjusting it based on the tilt of the bed etc, but not in relation to the end stops
It's not a big deal but I think it could catch someone out.

The way I get around this currently is to

  * Home machine
  * Attach the probe
  * heat the bed to aroung 60 degrees (just my own preference ro compensate for thermal expansion of the bed)
  * issue G30 S-1
  * repeat the home / G30 S-1 a couple of times to get a couple of values in the G-Code Log

  * raise the head by about 5mm, so the probe isn't touching the bed anymore
  * read the offset value in the G-Code logs, which in my case is **26.723**
  * Since I know the z probe offset is 16.6 (via a paper test I've done before)
    26.723 - 16.6 = 10.123 difference
  * so 300 - 10.123 = 289.877 as the new delta height

  * Lets set the new height with M665 H289.877
  * Next re-home the machine
  * Run delta-autocalibration
  * run "M500" to store the new settings into config-override.g

At this point if I home the machine then bring it down and do the paper test, it's spot on.
Unless this is supposed to be part of the existing G30 calibration
perhaps this should be automated via a new option for G30?
so instead of setting Z0, setting the delta height in relation to the end stops via a single probe to the center of the bed


## Auto Home

I've tweaked is the g-code within deltahome.g
https://github.com/grbd/GBD.3DPrinter.Kossel.Anycubic/blob/master/DuetBoard/Config/configv2/homedelta.g

This is a little less agressive and give more repeatable results when probing the bed with G30 S-1 after a homing cycle
compared to the the one from the configurator

## G30 / bed.g

For bed.g I used the configurator
However I needed to add a single **G30** to the beginning of the file
https://github.com/grbd/GBD.3DPrinter.Kossel.Anycubic/blob/master/DuetBoard/Config/configv2/bed.g

to set the Z0 correctly
otherwise it resulted in the probe crashing into the bed
this might have been due to the delta height being incorrect at the time I'm not sure
but it might be an idea to add it into the config generated by the configurator as a safety margin.















## Setting the initial delta height

1. set dive height to 100mm
M558 P4 R0.4 H100 F300 T3000

2. set defaults for delta calibration
M665 R134.4 L271.5 B116 H300
M666 X0 Y0 Z0

3. home device
4. run auto calibration
5. run M500 to store results

6. set dive height to 5mm
M558 P4 R0.4 H5 F300 T3000
7. re-run auto calibration


## Intial Probe calibration

1. home device
2. auto calibration
3. home device
4. move down 120
G1 Z120
5. allow travel below 0
M208 S1 Z-3

6. do a paper test
move slowly downwards to get offset

7. adjust delta height based on offset

current - works okay
M665 H290.024


## Calibration with G29 / Heated bed

next enable the heated bed lines
and G29 lines
re-run auto calibration
M500

## Tweaking height based on print

1. make a note of the existing delta height
M665
289.955

2. start a print of a long object
3. if it doest grip on the bed try increasing the delta height by 0.05mm at a time
using baby stepping
to get a final height
M665

-0.15mm is best - 290.105

## final probe adjust

we now know that our ideal delta height is 290.105
so we want that to show up after an autocalibration

1. adjust the G31 Z offset by small amounts
2. run auto calibration
3. check with M665 the new delta height
4. rinse and repeat untill the new delta height matches the known ideal

original is 16.6
G31 P100 X0 Y0 Z16.6

new
G31 P100 X0 Y0 Z16.695



todo
adding blu-tack to the inside of the probe helps prevent wobble
also set the A parameter to 10 for times to probe
