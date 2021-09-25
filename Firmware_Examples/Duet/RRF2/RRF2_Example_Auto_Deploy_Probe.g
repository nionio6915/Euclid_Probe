; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; RRF2.X Firmware Example
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                          ; relative positioning
echo "Lift Z in advance of deploy" 
G1 H2 Z15 F3000              ; move Z 15 for clearance above dock.
G90                          ; absolute positioning

; Dock side position is at X5 Y290
; Docked probe postion is at X5 Y305 
; Dock exit point is at X65 Y305 

G1 X5.0 Y290 F6000           ; move adjacent to probe dock location
M400                         ; wait for moves to finish

G1 X5 Y305 F3000             ;  move over dock 
G4 P250                      ; pause for pickup

G1 X65 Y305 F1200            ;  slide probe out of dock - slowly
M400

G90                          ; absolute positioning

G1 X150 Y150 Z10 F3000       ; move bed to clear probe from build surface 
M400                         ; wait for moves to finish

M564 S1                      ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro deployprobe.g complete"
