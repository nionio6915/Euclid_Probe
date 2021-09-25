; ***********************************************************
; Euclid Probe Manual Retract Probe Macro M402
; RRF3.x Firmware Example
; saveas system/retractprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

echo "running retractprobe.g macro"

; uncomment next line to echo the probe deploy state 
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

G90	                          ; absolute positioning

M564 S0                       ; allow beyond limit axis to print area

if sensors.probes[0].value[0]!= 0
    ; echo "Probe Value =" ^sensors.probes[0].value[0]
    ; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser
    abort "retractprobe: Probe not currently picked up!"

; echo "Probe Value =" ^sensors.probes[0].value[0]
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

; if we're here we know it's becasue the above is true which I assume is because you have an NC switch as a probe.
; echo "Passed first logic test to deploy probe"

G1 X100 Y10 F3000             ; move to center receiving position
M400                          ; wait for moves to finish

M291 P"Dettach Probe" S3      ; Deploy Probe Display Message Box  "OK" and "Cancel" are displayed 

G1 X150.0 Y150.0 F6000        ; move to the center of the bed
M400

M564 S1                       ; limit axis to print area

; echo "complete movement commands"

if sensors.probes[0].value[0]!= 1000
    ;echo "Probe Value =" ^sensors.probes[0].value[0]
    ; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser
    abort "retractprobe.g Probe not correctly dropped off in dock!"

M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro retractprobe.g complete"