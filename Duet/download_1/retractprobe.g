; ***********************************************************
;
; retractprobe.g
;
; ***********************************************************
M400
if sensors.probes[0].value[0] != 0
	abort "retractprobe: Probe not currently picked up!"	

M564 S0	; allow movement outside of print area
G90	; absolute positioning

;M98 P"move/medium.g"
M98 P"move/dock_out.g"
M98 P"move/dock.g"
M98 P"move/dock_side.g"

M564 S1 ; limit axis to print area

M400
if sensors.probes[0].value[0] != 1000
	abort "retractprobe: Probe not correctly dropped off in dock!"	

