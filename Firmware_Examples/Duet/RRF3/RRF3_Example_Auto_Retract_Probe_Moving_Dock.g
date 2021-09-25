; ***********************************************************
; Euclid Probe Fixed Dock Retract Probe Macro M402
; RRF3.x Firmware Example
; saveas system/retractprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

echo "running retractprobe.g macro"
; uncomment next line to echo the probe deploy state 
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

; Dock side position is at X0 Y30
; Docked probe postion is at X0 Y0 
; Dock entry/exit point is at X65 Y0 Z10 **USER MUST ESTABLISH EXIT HEIGHT Z

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

G1 X150 Y30 Z10 F3000         ; move to ready position 
G1 X65 Y0 Z10F 3000           ; move to the entry position for the dock
G1 X0 Y0 Z10 F300             ; move into the dock position
G4 P250                       ; pause 250 usecs 
G1 X0 Y30 Z10 F6000           ; move to the side adjacent to the dock swiping the probe off
M400

; uncomment next line to echo the probe value and probe deploy state 
; echo "Probe Value =" ^sensors.probes[0].value[0]
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

G1 X150.0 Y150.0 Z10 F6000        ; move to the center of the bed
M400

M564 S1                       ; limit axis to print area

; echo "complete movement commands"

if sensors.probes[0].value[0]!= 1000
    ; echo "Probe Value =" ^sensors.probes[0].value[0]
    ; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser
    abort "retractprobe.g Probe not correctly dropped off in dock!"

M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro retractprobe.g complete"