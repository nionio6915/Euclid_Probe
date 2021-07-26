; ***********************************************************
; Euclid Probe Fixed Dock M402 Retract Probe Macro
; saveas system/retractprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

M117 "Running deployprobe macro"


G1 X140 Y10 Z20 F6000         ; move to ready position
G1 X140 Y10 Z0 F600           ; lower to ready position to enter dock
G1 X168 Y10 Z0 F600           ; locate probe for decoupling
G4 P500                       ; pause 
G1 X168 Y50 F6000             ; swipe the dock off
G1 X168 Y60 Z20 F6000         ; move up to clear the bed
G1 X110 Y110 Z20              ; move to center of the bed

; end 