; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; RRF2.X Firmware Example
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************
; probe is -16.4 in X -29.4 in Y bed is 290 in X 325 in Y
; locations of probe points are at 
; (18, 285)     (270,285)
;
; (18,65)       (270,65)
;
; adjust coords so that probe hits symmetric points on bed and avoids dock

; echo "Running bed4point.g"
M558 F60 A3                              ; fix probe speed to 1mm/s
G90
G4 P250

; echo "Call deployprobe.g macro" 
M401                                            ; This runs macro file deployprobe
; echo "Return"

G30 P0 X18.0 Y65.0 F9000.0 Z-99999       ; probe front left PEI

G30 P1 X18.0 Y285.0 F9000.0 Z-99999      ; probe back left PEI

G30 P2 X270.0 Y285.0 F9000.0 Z-99999     ; probe back right PEI

G30 P3 X270.0 Y65.0 F9000.0 Z-99999 S3   ; probe near front right leadscrew and calibrate 3 motors PEI

; echo "Call retractprobe.g macro"
M402                                     ; retract probe
; echo "Return"

; echo "bed4point.g complete" 