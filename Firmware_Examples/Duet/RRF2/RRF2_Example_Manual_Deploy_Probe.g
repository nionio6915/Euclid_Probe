; ***********************************************************
; Euclid Probe Manual Deploy Probe Macro M401
; RRF2.X Firmware Example
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                          ; relative positioning
echo "Lift Z in advance of deploy" 
G1 H2 Z15 F3000              ; move Z 15 for clearance above dock.
G90                          ; absolute positioning

M291 P"Attach Probe"  S3     ; Deploy Probe Display Message Box  "OK" and "Cancel" are displayed 

G1 X100 Y10 F3000           ; move adjacent to probe dock location
M400                         ; wait for moves to finish

M291 
M564 S1                      ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro deployprobe.g complete"
