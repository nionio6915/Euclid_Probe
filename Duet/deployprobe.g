; ***********************************************************
;
; deployprobe.g
;
; ***********************************************************
M400
if sensors.probes[0].value[0]!=1000
	abort "deployprobe: Probe already picked up.  Manually return probe to the dock"	

G90	; absolute positioning

M564 S0	; allow movement outside of print area

;M98 P"move/medium.g"
M98 P"move/dock_side.g"
;G1 X6 Y-14.7 F12000
M98 P"move/dock.g"
; G1 X6 Y-24.7 F6000
M98 P"move/dock_out.g"
; G1 X50 Y-24.7 F12000
M98 P"move/dock_side.g"
; G1 X6 Y-14.7 F12000

M564 S1 ; limit axis to print area
M400
G4 P100
if sensors.probes[0].value[0] != 0
	abort "deployprobe: Probe not picked up!"	
	