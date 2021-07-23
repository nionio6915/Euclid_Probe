; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

M118 S"Manual deployprobe.g start"
G91                    ; Relative positioning

M564 H0 S0             ; allow movement while not homed
G1 Z15 F6000           ; move bed away for movement clearance

if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  abort "deployprobe: value0 Probe already picked up.  Manually return probe to the dock"

G90                    ; Absolute positioning 
G1 X150 Y0 F3000       ; move to the front-center of the bed for manual placement of the probe

M291 P"Attach Probe"  S3

if sensors.probes[0].value[0]!=0      ; if sensor is value other than 0 do this
   abort "deployprobe: endvalue not 0 Probe not picked up!  Print cancelled."