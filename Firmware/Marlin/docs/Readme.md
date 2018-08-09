# Readme

This is a collection of code diffs / hex files and notes
I've collected in an attept to update the firmware on my Anycubic Kossel Delta Linear Plus
from the stock firmware which appears to be 1.1.0Rc8 to 1.1.8

## Diffs

### Diffs/Anycubic-1.1.0-rc8.patch

This is a list of differences between stock 1.1.0-RC8 and the Anycubic Sources.
In order to figure out what changes they made to configure it for Marlin.
Note this is from the Anycubic website, but I'm not entirley sure it's the same as the firmware that came with the device
I think the position of the Probe isn't setup so these sources may have been for the one without the probe.

There's also some code in there that's no longer needed for 1.1.8 which turns the fan on when the extruder gets hotter than 60 degrees
Marlin now has a proper way to do this via configuration

### Diffs/namsugak-1.1.8.patch

List of differences in a firmware updated to 1.1.8 by namsugak
It has some stuff in for LED's I'm not using, but I'm using this to check my own configuration settings for 1.1.8

### Diffs/Gbd-1.1.8.patch

TODO
Add in my own patched sources diff / Hex files

## Hex Files

### Bin/OriginalFirmware/

TODO

### Bin/Gbd-Marlin-Base/

TODO
