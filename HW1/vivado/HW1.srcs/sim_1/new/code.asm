MOV   R1, $0
Load  R2, R1, $0
MAC   R5, R2, /, $1

MOV   R1, $1
MOV   R2, $5
Load  R3, R1, $0
Load  R4, R2, $0
MAC   R5, R3, R4, $0

Load  R3, R1, $1
Load  R4, R2, $1
MAC   R5, R3, R4, $0

Load  R3, R1, $2
Load  R4, R2, $2
MAC   R5, R3, R4, $0

Load  R3, R1, $3
Load  R4, R2, $3
MAC   R5, R3, R4, $0

MOV   R1, $10
Store /,  R1, R5