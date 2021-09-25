; ***********************************************************
; Euclid Probe Manual M401 Deploy Probe Macro
; Duet RRF ver 2.x
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

M118 S"deployprobe.g start"

G91
M564 H0 S0             ; allow movement while not homed
G1 Z15 F6000        ; move Z for clearance


G90 
G1 X150 Y0 F3000
M291 P"Attach Probe"  S3

