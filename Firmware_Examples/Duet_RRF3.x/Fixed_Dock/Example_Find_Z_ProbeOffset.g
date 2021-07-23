; ***********************************************************
; Euclid Probe Probe Offset Macro
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

M291 P"Probe will be tested 10 times and return mean and standard deviation. Ok or Cancel?" R"WARNING" S3 ; User must click OK or cancel.
G28 
M400

M401                         ; deploy probe

G1 X150 Y150 Z12             ; travel to probe point X150 Y150 12mm above bed
M400

G30 P0 X150 Y150 Z-9999      ; probe the point defined and set the stop height to the Z offset defined by G31 in config.g file 
G30 P1 X150 Y150 Z-9999
G30 P2 X150 Y150 Z-9999
G30 P3 X150 Y150 Z-9999
G30 P4 X150 Y150 Z-9999
G30 P5 X150 Y150 Z-9999
G30 P6 X150 Y150 Z-9999
G30 P7 X150 Y150 Z-9999
G30 P8 X150 Y150 Z-9999
G30 P9 X150 Y150 Z-9999 S-1  ; probe and display statistical data 

M402                         ; retract probe