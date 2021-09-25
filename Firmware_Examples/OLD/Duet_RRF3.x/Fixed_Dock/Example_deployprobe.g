; ***********************************************************
; Euclid Probe Fixed Dock M401 Deploy Probe Macro
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************

; echo "Running deployprobe.g"
; uncomment next line to echo the probe deploy state 
; echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

M564 H1 S0                   ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                      ; relative positioning
echo "Lift Z in advance of deploy" 
G1 H2 Z15 F3000          ; move Z 15 for clearance above dock.
;                        ; need to figure out some safety check on this
G90                                   ; absolute positioning

; echo "Probe Value =" ^sensors.probes[0].value[0]

if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  ; uncomment next line to echo the probe deploy state 
  ; echo "deployuser token = " ^sensors.probes[0].deployedByUser
  ; echo "Probe State = " ^sensors.probes[0].value[0]
    abort "deployprobe start value Probe already picked up.  Manually return probe to the dock"



; if we're here we know it's becasue the above is true which I assume is because you have an NC switch as a probe.
; echo "Passed first logic test to deploy probe"

; Dock side position is at X5 Y290
; Docked probe postion is at X5 Y305 
; Dock exit point is at X65 Y305 

G1 X5.0 Y290 F6000           ; move adjacent to probe dock location
M400                         ; wait for moves to finish

; echo "Probe Pickup while loop running"

; uncomment next line to echo the probe deplot state 
; echo "Object Model Deployuser token (before while loop) = " ^sensors.probes[0].deployedByUser

while sensors.probes[0].value[0]=1000
  G1 X5 Y305 F3000            ;  move over dock 
  G4 S1                       ; pause for pickup 
  echo "Probe Value =" ^sensors.probes[0].value[0]
  G1 X65 Y305 F1200           ;  slide probe out of dock - slowly
  M400
  ; G4 S1                     ; pause 1 seconds

echo "Probe Pickup while loop complete"

; uncomment to echo the probe deplot state 
; echo "Object Model Deployuser token (after while loop) = " ^sensors.probes[0].deployedByUser

G90                           ; absolute positioning
G1 X150 Y150 Z10 F3000        ; move bed to clear probe from build surface 
M400                          ; wait for moves to finish


if sensors.probes[0].value[0]!=0
  ; uncomment to echo the probe deploy state 
  echo "Object Model Deployuser token (in abort if section)= " ^sensors.probes[0].deployedByUser
  abort "Deployprobe endvalue not 0 Probe not picked up!  Deployt cancelled."
  
M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro deployprobe.g complete"
