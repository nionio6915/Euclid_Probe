; ***********************************************************
; Euclid Probe Fixed Dock M402 retractprobe macro
; RRF 2x on Duet 2 hardware
; saveas system/retractprobe.g
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

; echo "running retractprobe.g macro"

; Preflight position is X100 Y0
; Dock Side position is at X30 Y0
; Docked probe postion is at X0 Y0 
; Dock exit point is at X65 Y0 
; Dock Re-Entry Staging Position is at X0 Y70
; Probe Ready Position X150 Y150 

G90	                           ; absolute positioning

M564 S0                        ; allow movement outside the boundaries

G0 X0 Y70 F3000                ; move to the re-entry staging position
M400                           ; wait for moves to finish

G0 X0 Y40 F3000                ; move to the dock re-entry position
M400                           ; wait for moves to finish

G0 X0 Y0 F300                  ; move into the dock position
M400                           ; wait for moves to finish
G4 P250                        ; pause 250 usecs 

G0 X30 Y0 F6000                ; move to the side swipe off probe
G0 X100 Y0  F3000             ; move away from the dock
M400                          ; wait for moves to finish

G0 X150.0 Y150.0 F3000           ; move to the center of the bed
M400

M564 S1                        ; set movement limit to axis boundaries

echo "Macro retractprobe.g complete"