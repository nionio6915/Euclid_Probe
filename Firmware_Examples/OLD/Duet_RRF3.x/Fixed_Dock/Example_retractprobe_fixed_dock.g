; ***********************************************************
; Euclid Probe Fixed Dock M402 retractprobe macro
; saveas system/retractprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

echo "running retractprobe.g macro"
; uncomment next line to echo the probe deploy state 
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

; Dock side position is at X5 Y290
; Docked probe postion is at X5 Y305 
; Dock exit point is at X65 Y305 

G90	                         ; absolute positioning

M564 S0                      ; allow beyond limit axis to print area

if sensors.probes[0].value[0]!= 0
    echo "Probe Value =" ^sensors.probes[0].value[0]
    echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser
    abort "retractprobe: Probe not currently picked up!"

; echo "pass first logic loop"

echo "Probe Value =" ^sensors.probes[0].value[0]
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

G1 X65 Y305  F3000             ; move to the entry position for the dock
G1 X5  Y305  F300              ; move into the dock position
G4 P250                        ; pause 250 usecs 
G1 X5  Y260  F6000             ; move to the side adjacent to the dock
G1 X5  Y150  F6000             ; move away from the dock
M400
echo "Probe Value =" ^sensors.probes[0].value[0]
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

G1 X150.0 Y150.0 F6000           ; move to the center of the bed
M400

M564 S1                      ; limit axis to print area

; echo "complete movement commands"

if sensors.probes[0].value[0]!= 1000
    echo "Probe Value =" ^sensors.probes[0].value[0]
    ; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser
    abort "retractprobe.g Probe not correctly dropped off in dock!"

M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro retractprobe.g complete"