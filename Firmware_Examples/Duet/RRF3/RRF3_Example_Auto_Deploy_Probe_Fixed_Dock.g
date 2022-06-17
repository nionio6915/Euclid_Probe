; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; RRF3.X Firmware Example
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
;  | * Dock staging position                                                |
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

echo "Running deployprobe.g"
if !move.axes[0].homed || !move.axes[1].homed     ; If the printer hasn't been homed, home it
    M98 P"0:/sys/homexy.g" 

; uncomment next line to echo the probe deploy state 
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                          ; relative positioning
echo "Lift Z in advance of deploy" 
G0 H2 Z15 F3000              ; move Z 15 for clearance above dock.
;                            ; need to figure out some safety check on this
G90                          ; absolute positioning

; uncomment next line to echo the probe value 
; echo "Probe Value =" ^sensors.probes[0].value[0]

if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  ; uncomment next line to echo the probe deploy state 
  ; echo "deployuser token = " ^sensors.probes[0].deployedByUser
  ; echo "Probe State = " ^sensors.probes[0].value[0]
  abort "deployprobe start value Probe already picked up.  Manually return probe to the dock"

; if we're here we know it's becasue the above is true which I assume is because you have an NC switch as a probe.
; echo "Passed first logic test to deploy probe"

; Preflight position is X100 Y0
; Dock Side position is at X30 Y0
; Docked probe postion is at X0 Y0 
; Dock exit point is at X0 Y40 
; Dock Re-Entry Staging Position is at X0 Y70
; Probe Ready Position X150 Y150 

; echo "Probe Pickup macro running"

G0 X100 Y0 F6000              ; move to Preflight Position
M400                          ; wait for moves to finish

G0 X0 Y30 F6000               ; move to Dock Side dock location
M400                          ; wait for moves to finish

; uncomment next line to echo the probe deplot state 
; echo "Object Model Deployuser token (before while loop) = " ^sensors.probes[0].deployedByUser

G0 X0 Y0 F3000                ; move over Dock 
G4 P500                       ; pause 0.5 seconds
M400                          ; wait for moves to finish

; uncomment next line to echo the probe value 
; echo "Probe Value =" ^sensors.probes[0].value[0]

G0 X0 Y40 F300               ;  slide probe out of dock - slowly
G0 X0 Y70 F3000               ; move to re-entry position
M400                          ; wait for moves to finish

echo "Probe Pickup complete"

; uncomment to echo the probe deploy state 
; echo "Object Model Deployuser token (after while loop) = " ^sensors.probes[0].deployedByUser

G90                           ; absolute positioning
G0 X150 Y150 F3000            ; move to the center of the bed
M400                          ; wait for moves to finish


if sensors.probes[0].value[0]!=0
  ; uncomment to echo the probe deploy state 
  echo "Object Model Deployuser token (in abort if section)= " ^sensors.probes[0].deployedByUser
  abort "Deployprobe endvalue not 0 Probe not picked up!  Deployt cancelled."
  
M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro deployprobe.g complete"
