# Config

## General

### General Preferences

  * Board:  Duet 2 WIFI (default)
  * Firmware version: 1.21 or newer (default)
  * Firmware compatibility: Marlin
  * Enable non-volatile memory: unchecked
    I think this isnt needed since settings are read from the sd card on startup anyway
    so we dont need g-codes loaded from the eeprom
  * Save print state on power failure: ticked
  * Auto save threshold: 10 Volts (if the psu drops below this voltage)
  * Resume threshold: 11 Volts


### Printer Geometry

  * Delta Geometry
  * Printable radius: 116.0 mm
  * Minimum Z: 0 mm
  * Diagonal rod length: 271.5 mm
  * Homed height: 295.2 mm // Auto calibrate
  * Maximum carriage travel: // I thnk not used for delta, specifed 300

  * Add a warning in config.g if you are setting your homed height too high and will measure it during calibration: ticked

#### Delta Radius

  * Smooth rod offset - 186 mm
  * effector offset - 31 mm
  * carriage offset - 20.6 mm
  * radius = 186 - 31 - 20.6
  * radius: 134.4 // Auto calibrate


## Motors

### Axes

  * Direction: Forwards - TODO test
  * Microstepping: x16 interpolate
  * Max. instant speed change: 5
    This is the jerk speed under marlin
  * Max speed: 200
  * Acceleration: 2000
  * Motor current: 1200
    motor is nema17 / 40mm deep, typically these are rated at 1.5A, so 85% of that is approx 1.2A
    The figure you put in config.g is the peak current per phase

#### Steps per mm

  * Full steps per rotation: 200
  * Belt pitch: 2
  * Pulley teeth: 20
  * Motor Steps per mm: 200 * 16 / 2 / 20
  * Motor Steps per mm: 80


### Extruders

  * Number of extruders: 1

  * Direction: Forwards - TODO test
  * Microstepping: x16 interpolate
  * Max. instant speed change: 5
  * Max speed: 50
  * Acceleration: 2000
  * Motor current: 1200

#### Steps per mm

  * Motor Steps per mm: 96
    (originally 96 in marlin)


### Motor current reduction

  * Reduce motor currents automatically when idle: ticked (default)
  * Idle current percentage: 30% (default)
  * Idle timeout: 30s (default)


## Endstops

### Z-Probe

  * Probe X Offset: 0
  * Probe Y Offset: 0
  * Probing speed: 2
    TODO I think marlin is set to 1000
  * Mode: 4
  * Deploy / retract probe (unticked)
  * Trigger Height: +16.8 // requires manual calibration
  * Trigger Value: 100 (default)
  * Recovery time: 0.4 (default)

### Endstop configuration

Endstop Type

  * X - Active High / Normally Closed
  * Y - Active High / Normally Closed
  * Z - Active High / Normally Closed

### Homing preferences

TODO

  * Homing speed (first pass): 30 (default)
  * Homing speed (second pass): 6 (default)
  * Travel speed: 100 (default)
  * Z dive height: 5 (default)

tick the box under "Set initial homing speed to 10% for calibration and add a note to homedelta.g "

## Heaters

### General heater settings

  * Number of nozel heaters: 1
  * Assign bed heater to first nozzle: unticked (default)
  * Heated bed present: ticked (default)
  * Bed heater output: Bed (default)
  * Control Method: PID // TODO selected bang bang for now
  * Chamber heater present: unticked (default)

### Heaters

For both the bed and the hotend
In marlin the thermistor setting is 5
this is labled as - 100K thermistor - ATC Semitec 104GT-2/104NT-4-R025H42G (Used in ParCan & J-Head) (4.7k pullup)
in thermistortables.h this maps to thermistortable_5.h

I think we can fine tune the B / C values using a digital thermometer

Bed

  * Temp limit: 120
  * PMW limit: 100
  * Series res: 4700 // Resistor on the controller board that is in series (correct value for duet wifi)
  * R25: 100000 // 100K at 25C temperature
  * B: 4267
  * C: 0

E0

  * Temp limit: 275
  * PMW limit: 100
  * Series res: 4700 // Resistor on the controller board that is in series (correct value for duet wifi)
  * R25: 100000 // 100K at 25C temperature
  * B: 4267
  * C: 0

## Tools

### Tool mapping

  * Number of tools: 1
  * Wait for temperatures to be reached on tool change: ticked
  * Select first tool on start-up: ticked
  * all offsets: 0mm


## Compensation

### Delta calibration

  * Number of peripheral points: 10
  * Number of halfway points: 6
  * Number of calibration factors: 7
  * Probing radius: 110

### Grid compensation

  * Probing radius: 110
  * Spacing between probe points: 25 (default)

### Orthogonal axis compensation

TODO - leave unticked for now

## Network

### Network settings 

  * Printer name: Anycubic1
  * Enable network: ticked (default)
  * Aquire dynamic IP address via DHCP: ticked (default)
  * Enable Http: ticked (default)
  * Enable FTP: unticked (default)
  * Enable Telnet: unticked (default)

  * WIFI access point name: *****
  * Password: *****
  * WIFI Password: *****


## Finish

### Cooling fans

  * Confirmed that the fans are 12V

FAN0

  * Name: Part Fan
  * Value 100%
  * Invert output: No
  * Frequency: 31Hz
  * Thermostatic Control: No

FAN1

  * Name: Hotend Fan
  * Value 100%
  * Invert output: No
  * Frequency: 31Hz
  * Thermostatic Control: Yes
  * Monitored Heaters: E0
  * Trigger temperature: 60

FAN2

  * Name: Controller Fan
  * Value 100%
  * Invert output: No
  * Frequency: 31Hz
  * Thermostatic Control: No

### Miscellaneous

  * Custom G Codes / non required
