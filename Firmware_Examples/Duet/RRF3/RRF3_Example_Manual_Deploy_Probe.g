; ***********************************************************
; Euclid Probe M401 Manual Deploy Probe Macro
; RRF3.x Firmware Example
; saveas system/deployprobe.g
; comments and echo statements throughout are provided for convenience
; ***********************************************************
; echo "Running deployprobe.g"
; if !move.axes[0].homed || !move.axes[1].homed     ; If the printer hasn't been homed, home it
;    M98 P"0:/sys/homexy.g" 

; uncomment next line to echo the probe deploy state 
echo "Object Model Deployuser token =" ^sensors.probes[0].deployedByUser

M564 H1 S0                    ; Allow movement BEYOND axes boundaries (for Y to reach probe dock)

G91                           ; relative positioning
; echo "Lift Z in advance of deploy" 

G1 H2 Z15 F3000               ; move Z 15 for clearance above dock.
G90                           ; absolute positioning

; echo "Probe Value =" ^sensors.probes[0].value[0]

if sensors.probes[0].value[0]!=1000    ; if sensor is value other than 1000 do this
  ; uncomment next line to echo the probe deploy state 
  ; echo "deployuser token = " ^sensors.probes[0].deployedByUser
  ; echo "Probe State = " ^sensors.probes[0].value[0]
  abort "deployprobe start value Probe already picked up.  Manually return probe to the dock"

; if we're here we know it's becasue the above is true which I assume is because you have an NC switch as a probe.
; echo "Passed first logic test to deploy probe"

G1 X100 Y10 F3000             ; move to center receiving position
M400                          ; wait for moves to finish

M291 P"Attach Probe" S3       ; Deploy Probe Display Message Box  "OK" and "Cancel" are displayed 

; uncomment to echo the probe deploy state 
; echo "Object Model Deployuser token (after while loop) = " ^sensors.probes[0].deployedByUser

G90                           ; absolute positioning
G1 X150 Y150 Z15 F3000        ; move bed to clear probe from build surface 
M400                          ; wait for moves to finish

if sensors.probes[0].value[0]!=0
  ; uncomment to echo the probe deploy state 
  ; echo "Object Model Deployuser token (in abort if section)= " ^sensors.probes[0].deployedByUser
  abort "Deployprobe endvalue not 0 Probe not picked up!  Deployt cancelled."
  
M564 H1 S1                    ; Restrict movement to within axes boundaries (for normal Y movement)

echo "Macro deployprobe.g complete"
