
Under the duet we're currently getting
"M205 command is not supported"
from the G-code output from cura

  * http://marlinfw.org/docs/gcode/M205.html

This seems to be a setting for the acceleration / speed etc

according to this

  * https://duet3d.dozuki.com/Wiki/G-Codes_not_implemented

we should be using M566 instead

TODO check different outputs from cura

gcode output changed from Marlin to Reprap
check if this works

also
https://github.com/fieldOfView/ZOffsetPlugin
