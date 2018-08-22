1. printing at a higher temp such as 205 doesn't give as much adhesion as 190
so it's best to print the first layer at 190, then the follow on layer at 205 for a shiny surface finish

2. a bed temp of 50 is needed to avoid warping
a higher bed temp like 70 will stick more, but the lower layers won't cool quickly enough
which will result in the middle layers cooling before the lower ones
and a major warpage

3. general overrides

initial layer speed 5
printing temperature initial layer 190
initial layer height 0.1

4. with pla generally more fan is better for finer detail
however it can reduce bed adhesion so it's best to enable only after around 0.5mm or 6 layers

TODO try experimenting with 100% / 75%

5. rounded corners seem to be a big plus to avoid lifting as well on parts
although with a cooler bed at 50 it shouldn't be a problem

6. when leveling the bed / doing auto calibration
leave the bed at 60 for a long while to allow the heat to spread out / even out the bed
if a brim lifts at one corner this suggests the head is too far away at that corner

7. one technique I've found for bed adeshion is the initial layer height setting
at 0.1 the minimum this is good for calibrating the delta height of the printer
at a higher value the head is lifted up and more plastic is extruded to give a thicker initial layer
this sticks to the bed a lot better
however this seems to cause wrippling in the bottom surface layer
0.3 = default
0.2 = might be best

TODO try experimenting with 0.2 then baby step down by 0.05 to smoosh it into the bed


8. another technique to get better bed sticksion is to use a initial line width of 115%
https://www.sd3d.com/pla-settings/


In short

  * set the initial printing temp to 190 for the first layer, then something higher if wanted for the default for a shiny surface finish
  * use 0.1 for the initial layer height, avoid anything higher as it tends to cause wrippling - TODO
  * instead use 115% for the initial line width to help with adhesion, better alternative to large initial line height
  * use max 75% fan speed with 3 duct fan, and only full on after 0.5mm / 6 layers to help avoid warping
  * use a bed temp of 50 to avoid warping (this is a big one)
  * try to avoid non rounded corners in the model if warping is a problem

TODO
set heated bed for calibration back to 60
