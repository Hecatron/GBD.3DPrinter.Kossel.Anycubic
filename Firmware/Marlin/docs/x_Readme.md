# Readme

## Overview

This directory contains some hex binary files for different Marlin versions

  * **OriginalFirmware** - A backup of the version of Marlin that came with my Anycubic Kossel Linear Plus <br>
    This has version 1 of the probe as far as I can tell, and is Marlin 1.1.8RC8

  * **Gbd-Marlin-Base** - My own version of Marlin 1.1.8, no modifications other than trying to update from 1.1.0-RC8 to 1.1.8

When compiling using the Arduino Software

  * select the board Tools -> Board -> Arduino Genuino Mega or Mega 2560
  * select Verify / Compile
  * select Sketch -> Export Compiled Binary
  * the hex file (use the one without the bootloader) will be in the Marlin Source directory


## AVRDude commands

### Backup existing firmware

  * https://forum.arduino.cc/index.php?topic=403201.0

To backup the main firmware, reset the device then run
```
avrdude -p atmega2560 -c stk500v2 -P /dev/ttyUSB0 -b 115200 -U flash:r:flash_backup_file.hex
```

To backup the eeprom reset the device
make sure octoprint is disconnected
then run
```
avrdude -p atmega2560  -c stk500v2 -P /dev/ttyUSB0 -b 115200 -U eeprom:r:eeprom_backup_file.hex
```


### Write new firmware

To write a hex file
```
avrdude -p atmega2560  -c stk500v2 -P /dev/ttyUSB0 -b 115200 -e -U flash:w:flash_backup_file.hex
```

To write a backed up eeprom
```
avrdude -p atmega2560  -c stk500v2 -P /dev/ttyUSB0 -b 115200 -U eeprom:w:eeprom_backup_file.hex
```


### Hex to Bin conversion

to convert binary to hex
```
srec_cat.exe BinFile.bin -Binary -o HexFile.hex -Intel
```
to convert hex to binary
```
srec_cat.exe HexFile.hex -Intel -o BinFile.bin -Binary
```
