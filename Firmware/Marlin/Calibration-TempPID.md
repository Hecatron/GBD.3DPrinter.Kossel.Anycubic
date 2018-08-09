# Temperature PID Calibration

This covers the calibration of the HotEnd / Bed using PID

## PID Hotend

To fine tune the PID settings for the heater you need to run
```
M106 S255
M303 E0 C10 S200
```
This should work out a set of values to use in terms of 
what kind of signals / how fast to heat the heater block etc

The defaults in the config are from my own printer
```
#define  DEFAULT_Kp 37.56
#define  DEFAULT_Ki 3.99
#define  DEFAULT_Kd 88.47
```

## PID Heated Bed

To fine tune the PID settings for the heatbed you need to run
```
M303 E-1 C10 S90
```
Note I had to run this more than once, since it timed out the first time
due to the bed taking so long to heat

The defaults in the config are from my own printer
```
#define  DEFAULT_bedKp 785.35
#define  DEFAULT_bedKi 154.79
#define  DEFAULT_bedKd 996.11
```

## Store Settings

At this point you can ether alter the Configuration.h and re-upload a new firmware
or do a Store Settings to store the changed settings to EEPROM instead
