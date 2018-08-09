# G-Code Commands

## Firmware Info

To get the current version of the firmware use the command M115

The output of the default firmware included with the printer is
```
FIRMWARE_NAME:Marlin 1.1.0Anycubic SOURCE_CODE_URL: PROTOCOL_VERSION:1.0 MACHINE_TYPE:Anycubic EXTRUDER_COUNT:1 UUID:cede2a2f-41a2-4748-9b12-c55c62f367ff
```


## Get Autoleveling settings

### Zero Bed

Select Measure Zero Pos seems to run the following commands

  * G36 - shortcut to the below commands

  * G28 - Auto Home
  * G29 - Auto Bed Leveling - http://marlinfw.org/docs/gcode/G029-abl.html
  * G28 - Auto Home
  * M888 - Check bed Leveling? - seems to reset the printer

### Level Bed

  * G35 - shortcut to the below commands

  * G28 - Auto Home
  * G29 - Auto Bed Leveling - http://marlinfw.org/docs/gcode/G029-abl.html
  * G28 - Auto Home
  * G30 - Do a single Z probe at a specified position. By default probe in the current position.


### General List

  * G28 - Auto Home
  * G29 - Auto Bed Leveling - http://marlinfw.org/docs/gcode/G029-abl.html
  * G30 - Do a single Z probe at a specified position. By default probe in the current position.
  * M888 - reset machine?

  * M48 - This isn't on the menu, but tests the Z probe by sampling the same spot multiple times
  * M501 - I think can read the EEPROM settings

  * G33 ? delta auto calibration?
  * http://marlinfw.org/docs/features/auto_bed_leveling.html


### Probe test

  * M119 - I think we can use this to test the Z Probe (if it should be inverted)
  to invert the probe we need to change the below settings (default it true)
  Z_MIN_ENDSTOP_INVERTING
  Z_MIN_PROBE_ENDSTOP_INVERTING
