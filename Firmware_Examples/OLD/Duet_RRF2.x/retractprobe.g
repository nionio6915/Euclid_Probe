; ***********************************************************
; Euclid Probe Fixed Dock M401 Retract Probe Macro
; Duet RRF ver 2.x
; saveas system/retractprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

; echo "Running retractprobe.g"
M564 S0 ; overrride limit axis to print area
M400

G90	                          ; absolute positioning

M564 H1 S0                    ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G1 X90 Y280 F6000             ; move to the starting point (6000 for normal speed)

G1 X90 Y305.3  F3000          ; move to intermediate point (3000 for normal speed)
M400

G1 X40 Y305.3  F600           ; move to just outside dock position - leave at speed 300
M400

G1 X5.0 Y305.3  F600          ; move to dock and drop off probe
M400

G1 X5.0 Y280  F3000           ; move to the side adjacent to the dock
M400

G1 X150.0 Y150.0 F6000        ; move to the center of bed
M400


M564 S1 ; limit axis to print area
M400
G4 P100
