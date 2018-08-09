# Additional Settings

## Overview

This is a list of changes I think are different from the original Stock firmware
That I've included in my own version of the firmware

namsugak's firmware has G26_MESH_VALIDATION disabled, I've left this enabled



## Configuration.h

### Delta AutoCalibration

Delta Auto Calibration is enabled

  #define DELTA_AUTO_CALIBRATION
  #define DELTA_CALIBRATION_RADIUS 93.0 // Default 100.8mm

### Slower feedrate for homing

The feedrate for homing has been slowed down a bit
  #define HOMING_FEEDRATE_Z  (50*60)

### Slow Probe Speed

The probing speed has been slowed down from /2 to /3
  #define Z_PROBE_SPEED_SLOW (Z_PROBE_SPEED_FAST / 3)

### Delta Probable Radius

Delta probable radius changed from -30 to -10 
  #define DELTA_PROBEABLE_RADIUS (DELTA_PRINTABLE_RADIUS - 10)

### Unified Bed Leveling

These settings where taken from namsugak's firmware settings
  #define _PX(R,A) (R) * cos(RADIANS(A))
  #define _PY(R,A) (R) * sin(RADIANS(A))
  #define UBL_PROBE_PT_1_X _PX(DELTA_PROBEABLE_RADIUS, 0)   // Probing points for 3-Point leveling of the mesh
  #define UBL_PROBE_PT_1_Y _PY(DELTA_PROBEABLE_RADIUS, 0)
  #define UBL_PROBE_PT_2_X _PX(DELTA_PROBEABLE_RADIUS, 120)
  #define UBL_PROBE_PT_2_Y _PY(DELTA_PROBEABLE_RADIUS, 120)
  #define UBL_PROBE_PT_3_X _PX(DELTA_PROBEABLE_RADIUS, 240)
  #define UBL_PROBE_PT_3_Y _PY(DELTA_PROBEABLE_RADIUS, 240)

### Grid Max points

The default setting for this is 3, Anycubic stock uses 5, I've set it to 9
  #define GRID_MAX_POINTS_X 9

### Maximum Feedrate

THe max feedrate for the Extruder is lowered from 200 to 50
  #define DEFAULT_MAX_FEEDRATE          { 200, 200, 200, 50 }

### Fixed Probe

Indicates the probe is fixed
  #define FIX_MOUNTED_PROBE

### PID Autotune

Add PID Autotune to the LCD "Temperature" menu to run M303 and apply the result.
  #define PID_AUTOTUNE_MENU

### Print Counter

This allows pulling back information on the number of prints etc via M78
  #define PRINTCOUNTER

### Nozzel Park

Specify a position for the Nozzel parking position
  #define NOZZLE_PARK_FEATURE
  #define NOZZLE_PARK_POINT { (X_MIN_POS + 10), (Y_MAX_POS - 10), 30 }
  #define NOZZLE_PARK_Z_FEEDRATE 100     // Z axis feedrate in mm/s (not used for delta printers)

### No motion before homing

This should hopfully avoid crashes into the bed
  #define NO_MOTION_BEFORE_HOMING  // Inhibit movement until all axes have been homed


## Configuration_adv.h

### Case Fan

This should allow the use the unpopulated fan header 1
for a cooling fan for the main trigorilla board
  #define USE_CONTROLLER_FAN
  #define CONTROLLER_FAN_PIN 7

### Part Cooling Fan Kick

I've noticed when running the part cooling fan at low speeds it sometimes needs a kick to get it going
This should fix that
  #define FAN_KICKSTART_TIME 100

### Advanced Pause

This should enable the advanced pause feature
  #define ADVANCED_PAUSE_FEATURE
  #define FILAMENT_CHANGE_UNLOAD_FEEDRATE 25
  #define FILAMENT_CHANGE_LOAD_LENGTH 50
  #define ADVANCED_PAUSE_EXTRUDE_LENGTH 30
  #define PAUSE_PARK_NOZZLE_TIMEOUT 600
  #define PARK_HEAD_ON_PAUSE

### Z safe homing

I think this is safe to enable
it recommends switching on for probing / auto leveling
  #define Z_SAFE_HOMING





## TODO

### Leveling Fade Height

  This seems to be disabled in one of the firmware's I've come across
  for now I'm leaving it enabled
  TODO try measuring the height of a part, if it's too high / large then try disabling

  #define ENABLE_LEVELING_FADE_HEIGHT


### Alternative auto leveling

UBL Bed leveling seems to have more features and is more detailed
but I think it has issues on non square beds, in that sense Bilinear seems to be more reliable at least with 1.1.8

I need to retry AUTO_BED_LEVELING_UBL with 1.1.x bugfix branch which has more fixes



### software endstops

try enabling this
MIN_SOFTWARE_ENDSTOPS
MAX_SOFTWARE_ENDSTOPS


### Probe Z-offset

this seems to have wrecked my probe

MSG_DELTA_Z_OFFSET_CALIBRATE
Probe Z-offset

G33 P-1

after May 12
before May 15



### Bed Leveling

so far G33 seems to do a pretty good job of getting the bed level
but using the spiral calibration, it looks like there's some regions towards the outside of the plate
which are raised / too close to the nozzel (high points)

these might be caused by the existing plate brackets, so some new ones may get around this

  * try enabling / setting up bi-linear autoleveling next and switch it on to see if it compensates
  * try replacing the bed brackets with some different ones (needs to account for the ultrabase)
  * when printing the spiral reduce the scale to 95%



DELTA_CALIBRATION_RADIUS set to 110mm about 6mm short of the printable radius
also the bed wasn't properly seated.




### Diagaonal Rod

We can tweak this value to alter the scale of the print

  * The larger this value, the smaller in scale the part becomes
  * The smaller this value, the larger in scale the part becomes


### EStep Tuning

Remember to tune the E Steps for the amount of filament extruded
(tape on filament, measure out 50mm etc)
