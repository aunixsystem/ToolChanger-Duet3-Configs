M564 S0 						; allow movement outside the normal limits

;Drop Bed
G91
G1 Z2 F2000
G90

;brush in
G1 X300 Y93 F50000
G1 X315 Y90 F50000
G1 X300 Y87 F50000
G1 X315 Y84 F50000
G1 X300 Y81 F50000
G1 X315 Y78 F50000
G1 X300 Y75 F50000

;Brush Out
G1 X300 Y75 F50000
G1 X315 Y78 F50000
G1 X300 Y81 F50000
G1 X315 Y84 F50000
G1 X300 Y87 F50000
G1 X315 Y90 F50000
G1 X300 Y93 F50000

M564 S1 						; allow movement outside the normal limits