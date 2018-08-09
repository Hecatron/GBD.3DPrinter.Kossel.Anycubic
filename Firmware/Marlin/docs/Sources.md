# Sources


## Base Marlin Source

### Default Marlin

 we can download the default marlin firmware for 1.1.8 - Dec 25, 2017 from here
 (unconfigured)

  * https://github.com/MarlinFirmware/Marlin/tree/1.1.8

### Bugfix 1.1.x

The latest devel version is 1.1.x, this also has a patch in for trigorilla board support

  * https://github.com/MarlinFirmware/Marlin/pull/8367
  * https://github.com/MarlinFirmware/Marlin/tree/bugfix-1.1.x

### Arduino Libraries

We may need the following arduino libs installed

  * https://github.com/olikraus/U8glib_Arduino \\
    For a full graphics display


## Stock Firmware

  * http://www.anycubic3d.com/support/show/594034.html
  * https://www.thingiverse.com/thing:2220077

There seems to be around 3 different versions of the firmware available from the official site

  * Kossel Plus_20170712
    This seems to be a source based distro, I think the same version included with the printer Marlin 1.1.0-RC8 - 6 Dec 2016
    TODO is autoleveling enabled?
 
  * ANYCUBICkossel Auto leveling_20171113 (version 1 / version 2)
    This includes two binary based hex files (no source) also appears to be Marlin 1.1.0
    It looks like there's 2 different versions of the probe so they've included 2 versions and a picture to match against the probe
    My probe appears to be V1, I suspect the V2 probe has a different height measurement.

In order to work out what custom settings have been applied we can compare it to version 1.1.0-RC8

  * https://github.com/MarlinFirmware/Marlin/tree/1.1.0-RC8

see Diffs/Anycubic-1.1.0-rc8.patch


## Other Firmwares

### namsugak firmware

This appears to have Neopixel support and is based on 1.1.8
however it's setup for the V2 sensor, I think mine is V1

  * https://www.thingiverse.com/thing:2803527

### ArtieH firmware

This one is more recent, it's based on the 1.1.x bugfix branch
this seems to be more of a dev version

  * https://www.thingiverse.com/thing:2927795

### Another firmware

  * https://github.com/ruevs/Marlin_Anycubic_Kossel
