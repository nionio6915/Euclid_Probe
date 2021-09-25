; ***********************************************************
; Euclid Probe Fixed Dock M402 retractprobe macro
; RRF 2x on Duet 2 hardware
; saveas system/retractprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

; echo "running retractprobe.g macro"

; Dock side position is at X5 Y290
; Docked probe postion is at X5 Y305 
; Dock exit point is at X65 Y305 

G90	                           ; absolute positioning

M564 S0                        ; allow movement outside the boundaries

G1 X65 Y305  F3000             ; move to the entry position for the dock

G1 X5  Y305  F300              ; move into the dock position

G4 P250                        ; pause 250 usecs 

G1 X5  Y260  F6000             ; move to the side adjacent to the dock

G1 X5  Y150  F6000             ; move away from the dock
M400

G1 X150.0 Y150.0 F6000           ; move to the center of the bed
M400

M564 S1                        ; set movement limit to axis boundaries

echo "Macro retractprobe.g complete"