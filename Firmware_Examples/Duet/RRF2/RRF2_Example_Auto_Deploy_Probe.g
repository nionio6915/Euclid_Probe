; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; RRF2.X Firmware Example
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************
;  __________________________________________________________________________
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                * Probe Ready Position                  |
;  |                                  X150 Y150                             |
;  |                                                                        |
;  |                                                                        |
;  | * Dock Re-entry staging  position                                      |
;  |   X0 Y70                                                               |
;  |                                                                        |
;  |                                                                        |
;  | * Dock Exit Position                                                   | 
;  |   X0 Y40                                                               |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |                                                                        |
;  |   X0 Y0    X30 Y0       X100 Y0                                        |
;  | * Dock   * Dock Side  * Dock Preflight                                 |
;  |________________________________________________________________________| 
;
; Above is example 300x300 bed to coorelate with macros and movements below.
; This example is for a fixed dock, fixed gantry/carraige and moving bed motion system. 
; RailCore, Ender5, V-Core3, etc...
; coordinates are re-written below above the macros

M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                          ; relative positioning
echo "Lift Z in advance of deploy" 
G0 H2 Z15 F3000              ; move Z 15 for clearance above dock.
G90                          ; absolute positioning

; Preflight position is X100 Y0
; Dock Side position is at X30 Y0
; Docked probe postion is at X0 Y0 
; Dock exit point is at X65 Y0 
; Dock Re-Entry Staging Position is at X0 Y70
; Probe Ready Position X150 Y150 

G0 X100 Y0 G3000             ; move ot preflight position
M400                         ; wait for moves to finish

G0 X30 Y0 F3000              ; move adjacent to probe dock location
M400                         ; wait for moves to finish

G0 X0 Y0 F3000               ;  move over dock 
G4 P250                      ; pause for pickup

G0 X0 Y40 F300              ;  slide probe out of dock - slowly
G0 X0 Y70 F3000
M400                         ; wait for moves to finish

G0 X150 Y150 F6000           ; move to center of bed 
M400                         ; wait for moves to finish

M564 S1                      ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro deployprobe.g complete"
