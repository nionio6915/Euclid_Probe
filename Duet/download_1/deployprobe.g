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
M98 P"move/dock.g"
M98 P"move/dock_out.g"
M98 P"move/dock_side.g"

M564 S1 ; limit axis to print area
M400
G4 P100
if sensors.probes[0].value[0] != 0
	abort "deployprobe: Probe not picked up!"	
	