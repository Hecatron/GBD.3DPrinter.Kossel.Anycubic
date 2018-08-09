# Readme

## Overview

This is a custom firmware I've come up with for the Anycublic Kossel Linear Plus.
This is the one with the linear guides.

Also I'm using Version 1 of the Probe
As near as I can tell there were two different probes shipped with the Anycublic Kossel Linear Plus.
which uses the probe for autoleveling the bed.

  * Version 1 - has a Z offset of -19.00 below the extruder (this is the one I'm using)
  * Version 2 - has a Z offset of -14.90 below the extruder

It's possible to build your own firmware from the patches I've provided here.
These patches are against Marlin 1.1.8. See the docs directory for information on building the sources.


## Upgrading

### Backup existing firmware

First we want to backup the existing firmware just to be safe
```
avrdude -p atmega2560 -c stk500v2 -P /dev/ttyUSB0 -b 115200 -U flash:r:flash_backup_file.hex
avrdude -p atmega2560  -c stk500v2 -P /dev/ttyUSB0 -b 115200 -U eeprom:r:eeprom_backup_file.hex
```

### Upload new firmware

To overwrite / update the firmware to the one in this repository
see the file \bin\Gbd-Marlin-ProbeV1\Gbd-Marlin.ino.mega.hex
```
avrdude -p atmega2560  -c stk500v2 -P /dev/ttyUSB0 -b 115200 -e -U flash:w:Gbd-Marlin.ino.mega.hex
```

### Reset Settings

To reset the settings to all default settings
and to store them in EEPROM

  * Select Control -> Restore Failsafe
  * Select Control -> Store Settings

