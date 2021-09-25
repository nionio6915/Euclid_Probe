; ***********************************************************
; Euclid Probe Fixed Dock example homez.g
; Duet RRF ver 2.x
; saveas system/homez.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

echo "Running homez.g"
; M561                        ; clear any bed transform
; M290 S0 R0                  ; clear baby steps

M564 S0                       ; override limit axis to print area

G1 H2 Z5 F1000                ; lift Z relative to current position
M400




G90	                          ; absolute positioning

echo "Call deployprobe.g macro" 
M401                          ; This runs macro file deployprobe
echo "returned from deployprobe.g"

G1 X150 Y150 F4000  ; go to bed center probe point
M400                          ; wait for moves to complete

echo "Execute G30 command"
G30                           ; home Z by probing the bed
M400

echo "Call retractprobe.g macro"
M402 P0                       ; retract / remove probe

M564 S1 ; limit axis to print area
M400
G4 P100
