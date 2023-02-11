; tfree3.g
; called when tool 3 is freed

;Drop the bed
G91
G1 Z4 F1000
G90

;M564 S0 						; allow movement outside the normal limits

;Purge nozzle
;M98 P"purge.g"

;Move In
G53 G1 X307 Y150 F50000
G53 G1 X307 Y180 F50000
G53 G1 X307 Y202.5 F2500

;Open Coupler
M98 P"/macros/Coupler - Unlock"

;fan off
M106 P8 S0

;Move Out
G53 G1 X307 Y100 F50000

;M564 S1 						; apply the normal limits again
