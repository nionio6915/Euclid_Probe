; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

M117 "Running deployprobe macro"

G28 X Y Z                    ; home axis 
G1 P500

G1 Z20 F3000                 ; move Z for running clearance
G1 Y50 F6000                 ; move to ready Y50 
G1 X168 Y50 Z10 F6000        ; move to ready adjacent
G1 X168 Y50 Z0 F3000         ; move to dock adjacent position
G4 P500                      ; wait 250 usecs
G1 X168 Y10 Z0 F3000         ; pick up probe
G4 P500                      ; wait 250 usecs
G1 X140 Y10 Z0 F300          ; exit dock
G1 X140 Y10 Z20 F600         ; move up
G1 X110 Y110 Z10 F3000

; end 