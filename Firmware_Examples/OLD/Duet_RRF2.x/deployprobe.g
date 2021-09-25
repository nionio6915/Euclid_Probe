; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; Duet RRF ver 2.x
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

; echo "Running deployprobe.g"

G90	; absolute positioning

M564 S0	; allow movement outside of print area

; move dock side
G1 X6 Y290 F12000
M400

; move over dock
G1 X6 Y305 F6000
G4 P250
M400

; move dock out
G1 X65 Y305 F12000
M400

;  move to center
G1 X150 Y305 F12000
G1 X150 Y150 F12000
M400 

M564 S1 ; limit axis to print area
M400
G4 P100
