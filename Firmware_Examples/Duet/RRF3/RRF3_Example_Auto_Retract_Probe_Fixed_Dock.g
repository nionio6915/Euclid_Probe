; ***********************************************************
; Euclid Probe Fixed Dock Retract Probe Macro M402
; RRF3.x Firmware Example
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

echo "running retractprobe.g macro"
; uncomment next line to echo the probe deploy state 
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

; Preflight position is X100 Y0
; Dock Side position is at X30 Y0
; Docked probe postion is at X0 Y0 
; Dock exit point is at X65 Y0 
; Dock Re-Entry Staging Position is at X0 Y70
; Probe Ready Position X150 Y150 

G90	                          ; absolute positioning

M564 S0                       ; allow beyond limit axis to print area

if sensors.probes[0].value[0]!= 0
    echo "Probe Value =" ^sensors.probes[0].value[0]
    echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser
    abort "retractprobe: Probe not currently picked up!"

; echo "pass first logic loop"

; uncomment next line to echo the probe value and probe deploy state 
; echo "Probe Value =" ^sensors.probes[0].value[0]
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

G0 X0 Y70 F3000               ; move to Dock Re-entry staging position 
M400                          ; wait for moves to finish

G0 X0 Y40  F3000              ; move to the entry position for the dock
M400                          ; wait for moves to finish

G0 X0 Y0  F300                ; move into the dock position
M400                          ; wait for moves to finish
G4 P250                       ; pause 250 usecs 

G0 X0 Y30 F6000               ; move to the side adjacent to the dock swiping the probe off
G0 X100 Y0 F3000              ; move to the side adjacent to the dock swiping the probe off
M400                          ; wait for moves to finish

; uncomment next line to echo the probe value and probe deploy state 
; echo "Probe Value =" ^sensors.probes[0].value[0]
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

G0 X150.0 Y150.0 F6000        ; move to the center of the bed
M400                          ; wait for moves to finish

M564 S1                       ; limit axis to print area

; echo "complete movement commands"

if sensors.probes[0].value[0]!= 1000
    ; echo "Probe Value =" ^sensors.probes[0].value[0]
    ; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser
    abort "retractprobe.g Probe not correctly dropped off in dock!"

M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro retractprobe.g complete"