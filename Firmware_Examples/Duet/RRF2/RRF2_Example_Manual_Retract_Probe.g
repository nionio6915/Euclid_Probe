; ***********************************************************
; Euclid Probe Manual Retract Probe Macro M402
; RRF2.X Firmware Example
; saveas system/retractprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                          ; relative positioning
echo "Lift Z in advance of retract"
 
G1 H2 Z15 F3000              ; move Z 15 for clearance above dock.
G90                          ; absolute positioning

G1 XX100 Y10 F3000           ; move adjacent to probe dock location
M400                         ; wait for moves to finish

M291 P"Detach Probe"  S3     ; Deploy Probe Display Message Box  "OK" and "Cancel" are displayed 

M564 S1                      ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro retractprobe.g complete"
