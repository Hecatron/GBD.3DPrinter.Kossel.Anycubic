# Notes

## Configuration Notes

### Motherboard setting

  * original mother board setting was BOARD_RAMPS_13_EFB -> 33 in boards.h
  * this is checked in pins.h - MB(RAMPS_13_EFB)
  * this sets IS_RAMPS_EFB
  * then includes pins_RAMPS_13.h which defines IS_RAMPS_13

  * new mother board setting is BOARD_TRIGORILLA -> 343 in boards.h
  * this is checked in pins.h - MB(TRIGORILLA)
  * then includes pins_TRIGORILLA.h
  * IS_RAMPS_EFB is set here instead
  * pins_RAMPS_13.h is then included which defines IS_RAMPS_13

### Fan fix

It looks like there was some code in originally to turn on the fan for the coldend when it got over 60 degrees
a sort of workaround for this
https://github.com/MarlinFirmware/Marlin/issues/3234

I think that code is no longer needed if we use the following in config_adv

#define E0_AUTO_FAN_PIN 44 <- we dont need to set this as it's captured within pins_TRIGORILLA.h via ORIG_E0_AUTO_FAN_PIN
#define E1_AUTO_FAN_PIN -1
#define E2_AUTO_FAN_PIN -1
#define E3_AUTO_FAN_PIN -1
#define E4_AUTO_FAN_PIN -1
#define EXTRUDER_AUTO_FAN_TEMPERATURE 60
#define EXTRUDER_AUTO_FAN_SPEED   255  // == full speed

also within pins_TRIGORILLA.h I've commented out the code that sets FAN_PIN to 44
as that should be left at pin 9 for the part fan


### endstops

I dont think the below is needed - in pins_RAMPS_OLD.h
the pins are never used, but are available

 //
 // Limit Switches
 //
-#define X_MIN_PIN           3
+#define X_MIN_PIN           -1
 #define X_MAX_PIN           2
-#define Y_MIN_PIN          16
+#define Y_MIN_PIN          -1
 #define Y_MAX_PIN          17
 #define Z_MIN_PIN          18
 #define Z_MAX_PIN          19

### Probe

For Version 1 I think it's
#define X_PROBE_OFFSET_FROM_EXTRUDER 0     // X offset: -left  +right  [of the nozzle]
#define Y_PROBE_OFFSET_FROM_EXTRUDER 0     // Y offset: -front +behind [the nozzle]
#define Z_PROBE_OFFSET_FROM_EXTRUDER -19.0   // Z offset: -below +above  [the nozzle], Anycubic Leveling Module v1:-19.0, v2:-14.9

For version 2 it's
#define X_PROBE_OFFSET_FROM_EXTRUDER 0     // X offset: -left  +right  [of the nozzle]
#define Y_PROBE_OFFSET_FROM_EXTRUDER 0     // Y offset: -front +behind [the nozzle]
#define Z_PROBE_OFFSET_FROM_EXTRUDER -14.9   // Z offset: -below +above  [the nozzle], Anycubic Leveling Module v1:-18.0, v2:-14.9


### Code patch

It looks like theres an issue for delta printers
if DELTA is enabled
but the following is not set within Configuration.h MIN_SOFTWARE_ENDSTOPS MAX_SOFTWARE_ENDSTOPS
then HAS_SOFTWARE_ENDSTOPS is never set

this leads to the following not being declared
  float soft_endstop_radius, soft_endstop_radius_2;

this creates a problem when compiling the update_software_endstops function

simple fix is to use

#if IS_KINEMATIC
  float soft_endstop_radius, soft_endstop_radius_2;
#endif
#if HAS_SOFTWARE_ENDSTOPS
  bool soft_endstops_enabled = true;
#endif


