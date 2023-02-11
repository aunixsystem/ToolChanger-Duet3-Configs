; tpre1.g
; called before tool 1 is selected

;Unlock Coupler
M98 P"/macros/Coupler - Unlock"

;M564 S0 						; allow movement outside the normal limits

;Move to location
G53 G1 X81.5 Y100 F50000

;Move in
G53 G1 X81.5 Y180 F50000

;Collect
G53 G1 X81.5 Y202.5 F2500

;Close Coupler
M98 P"/macros/Coupler - Lock"

;WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING! WARNING!
;if you are using non-standard length hotends ensure the bed is lowered enough BEFORE undocking the tool!
G91
G53 G1 Z10 F1000
G90

;Move Out
G53 G1 X81.5 Y100 F4000

M208 Y38						; set Y max for this tool
;M564 S1 						; apply the normal limits again
