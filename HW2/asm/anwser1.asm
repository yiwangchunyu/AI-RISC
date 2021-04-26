MOV       r1,    $0,  [AB],      $0     // address bias (C)R
MOV       r2,    $0,  [AW],      $0     // address weights (B)Q
MOV       r3,    $0,  [AX],      $0     // address input  X (A)P
MOV       r4,    $0,  [AY],      $0     // address output Y = AB+C

Vload    vr0,    r1,    $0              // load bias: R00
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $0              // load weights: Q00
Vload    vr1,    r2,    $2              // load weights: Q01
Vload    vr2,    r2,    $4              // load weights: Q02
Vload    vr3,    r2,    $6              // load weights: Q03
Vload    vr4,    r3,    $0              // load input: P00
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $1              // load weights: Q10
Vload    vr1,    r2,    $3              // load weights: Q11
Vload    vr2,    r2,    $5              // load weights: Q12
Vload    vr3,    r2,    $7              // load weights: Q13
Vload    vr4,    r3,    $1              // load input: P01
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $0,    r4,   vr7              // store output:Y00,Y01,Y02,Y03

Vload    vr0,    r1,    $1              // load bias: R01
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $8              // load weights: Q04
Vload    vr1,    r2,   $10              // load weights: Q05
Vload    vr2,    r2,   $12              // load weights: Q06
Vload    vr3,    r2,   $14              // load weights: Q07
Vload    vr4,    r3,    $0              // load input: P00
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $9              // load weights: Q14
Vload    vr1,    r2,   $11              // load weights: Q15
Vload    vr2,    r2,   $13              // load weights: Q16
Vload    vr3,    r2,   $15              // load weights: Q17
Vload    vr4,    r3,    $1              // load input: P01
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $1,    r4,   vr7              // store output:Y04,Y05,Y06,Y07

Vload    vr0,    r1,    $2              // load bias: R10
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $0              // load weights: Q00
Vload    vr1,    r2,    $2              // load weights: Q01
Vload    vr2,    r2,    $4              // load weights: Q02
Vload    vr3,    r2,    $6              // load weights: Q03
Vload    vr4,    r3,    $2              // load input: P10
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $1              // load weights: Q10
Vload    vr1,    r2,    $3              // load weights: Q11
Vload    vr2,    r2,    $5              // load weights: Q12
Vload    vr3,    r2,    $7              // load weights: Q13
Vload    vr4,    r3,    $3              // load input: P11
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $2,    r4,   vr7              // store output:Y10,Y11,Y12,Y13

Vload    vr0,    r1,    $3              // load bias: R11
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $8              // load weights: Q04
Vload    vr1,    r2,   $10              // load weights: Q05
Vload    vr2,    r2,   $12              // load weights: Q06
Vload    vr3,    r2,   $14              // load weights: Q07
Vload    vr4,    r3,    $2              // load input: P10
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $9              // load weights: Q14
Vload    vr1,    r2,   $11              // load weights: Q15
Vload    vr2,    r2,   $13              // load weights: Q16
Vload    vr3,    r2,   $15              // load weights: Q17
Vload    vr4,    r3,    $3              // load input: P11
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $3,    r4,   vr7              // store output:Y14,Y15,Y16,Y17

Vload    vr0,    r1,    $4              // load bias: R20
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $0              // load weights: Q00
Vload    vr1,    r2,    $2              // load weights: Q01
Vload    vr2,    r2,    $4              // load weights: Q02
Vload    vr3,    r2,    $6              // load weights: Q03
Vload    vr4,    r3,    $4              // load input: P20
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $1              // load weights: Q10
Vload    vr1,    r2,    $3              // load weights: Q11
Vload    vr2,    r2,    $5              // load weights: Q12
Vload    vr3,    r2,    $7              // load weights: Q13
Vload    vr4,    r3,    $5              // load input: P21
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $4,    r4,   vr7              // store output:Y20,Y21,Y22,Y23

Vload    vr0,    r1,    $5              // load bias: R21
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $8              // load weights: Q04
Vload    vr1,    r2,   $10              // load weights: Q05
Vload    vr2,    r2,   $12              // load weights: Q06
Vload    vr3,    r2,   $14              // load weights: Q07
Vload    vr4,    r3,    $4              // load input: P20
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $9              // load weights: Q14
Vload    vr1,    r2,   $11              // load weights: Q15
Vload    vr2,    r2,   $13              // load weights: Q16
Vload    vr3,    r2,   $15              // load weights: Q17
Vload    vr4,    r3,    $5              // load input: P21
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $5,    r4,   vr7              // store output:Y24,Y25,Y26,Y27

Vload    vr0,    r1,    $6              // load bias: R30
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $0              // load weights: Q00
Vload    vr1,    r2,    $2              // load weights: Q01
Vload    vr2,    r2,    $4              // load weights: Q02
Vload    vr3,    r2,    $6              // load weights: Q03
Vload    vr4,    r3,    $6              // load input: P30
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $1              // load weights: Q10
Vload    vr1,    r2,    $3              // load weights: Q11
Vload    vr2,    r2,    $5              // load weights: Q12
Vload    vr3,    r2,    $7              // load weights: Q13
Vload    vr4,    r3,    $7              // load input: P31
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $6,    r4,   vr7              // store output:Y30,Y31,Y32,Y33

Vload    vr0,    r1,    $7              // load bias: R31
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $8              // load weights: Q04
Vload    vr1,    r2,   $10              // load weights: Q05
Vload    vr2,    r2,   $12              // load weights: Q06
Vload    vr3,    r2,   $14              // load weights: Q07
Vload    vr4,    r3,    $6              // load input: P30
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $9              // load weights: Q14
Vload    vr1,    r2,   $11              // load weights: Q15
Vload    vr2,    r2,   $13              // load weights: Q16
Vload    vr3,    r2,   $15              // load weights: Q17
Vload    vr4,    r3,    $7              // load input: P31
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $7,    r4,   vr7              // store output:Y34,Y35,Y36,Y37

Vload    vr0,    r1,    $8              // load bias: R40
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $0              // load weights: Q00
Vload    vr1,    r2,    $2              // load weights: Q01
Vload    vr2,    r2,    $4              // load weights: Q02
Vload    vr3,    r2,    $6              // load weights: Q03
Vload    vr4,    r3,    $8              // load input: P40
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $1              // load weights: Q10
Vload    vr1,    r2,    $3              // load weights: Q11
Vload    vr2,    r2,    $5              // load weights: Q12
Vload    vr3,    r2,    $7              // load weights: Q13
Vload    vr4,    r3,    $9              // load input: P41
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $8,    r4,   vr7              // store output:Y40,Y41,Y42,Y43

Vload    vr0,    r1,    $9              // load bias: R41
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $8              // load weights: Q04
Vload    vr1,    r2,   $10              // load weights: Q05
Vload    vr2,    r2,   $12              // load weights: Q06
Vload    vr3,    r2,   $14              // load weights: Q07
Vload    vr4,    r3,    $8              // load input: P40
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $9              // load weights: Q14
Vload    vr1,    r2,   $11              // load weights: Q15
Vload    vr2,    r2,   $13              // load weights: Q16
Vload    vr3,    r2,   $15              // load weights: Q17
Vload    vr4,    r3,    $9              // load input: P41
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore    $9,    r4,   vr7              // store output:Y44,Y45,Y46,Y47

Vload    vr0,    r1,   $10              // load bias: R50
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $0              // load weights: Q00
Vload    vr1,    r2,    $2              // load weights: Q01
Vload    vr2,    r2,    $4              // load weights: Q02
Vload    vr3,    r2,    $6              // load weights: Q03
Vload    vr4,    r3,   $10              // load input: P50
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $1              // load weights: Q10
Vload    vr1,    r2,    $3              // load weights: Q11
Vload    vr2,    r2,    $5              // load weights: Q12
Vload    vr3,    r2,    $7              // load weights: Q13
Vload    vr4,    r3,   $11              // load input: P51
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore   $10,    r4,   vr7              // store output:Y50,Y51,Y52,Y53

Vload    vr0,    r1,   $11              // load bias: R51
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $8              // load weights: Q04
Vload    vr1,    r2,   $10              // load weights: Q05
Vload    vr2,    r2,   $12              // load weights: Q06
Vload    vr3,    r2,   $14              // load weights: Q07
Vload    vr4,    r3,   $10              // load input: P50
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $9              // load weights: Q14
Vload    vr1,    r2,   $11              // load weights: Q15
Vload    vr2,    r2,   $13              // load weights: Q16
Vload    vr3,    r2,   $15              // load weights: Q17
Vload    vr4,    r3,   $11              // load input: P51
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore   $11,    r4,   vr7              // store output:Y54,Y55,Y56,Y57

Vload    vr0,    r1,   $12              // load bias: R60
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $0              // load weights: Q00
Vload    vr1,    r2,    $2              // load weights: Q01
Vload    vr2,    r2,    $4              // load weights: Q02
Vload    vr3,    r2,    $6              // load weights: Q03
Vload    vr4,    r3,   $12              // load input: P60
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $1              // load weights: Q10
Vload    vr1,    r2,    $3              // load weights: Q11
Vload    vr2,    r2,    $5              // load weights: Q12
Vload    vr3,    r2,    $7              // load weights: Q13
Vload    vr4,    r3,   $13              // load input: P61
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore   $12,    r4,   vr7              // store output:Y60,Y61,Y62,Y63

Vload    vr0,    r1,   $13              // load bias: R61
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $8              // load weights: Q04
Vload    vr1,    r2,   $10              // load weights: Q05
Vload    vr2,    r2,   $12              // load weights: Q06
Vload    vr3,    r2,   $14              // load weights: Q07
Vload    vr4,    r3,   $12              // load input: P60
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $9              // load weights: Q14
Vload    vr1,    r2,   $11              // load weights: Q15
Vload    vr2,    r2,   $13              // load weights: Q16
Vload    vr3,    r2,   $15              // load weights: Q17
Vload    vr4,    r3,   $13              // load input: P61
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore   $13,    r4,   vr7              // store output:Y64,Y65,Y66,Y67

Vload    vr0,    r1,   $14              // load bias: R70
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $0              // load weights: Q00
Vload    vr1,    r2,    $2              // load weights: Q01
Vload    vr2,    r2,    $4              // load weights: Q02
Vload    vr3,    r2,    $6              // load weights: Q03
Vload    vr4,    r3,   $14              // load input: P70
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $1              // load weights: Q10
Vload    vr1,    r2,    $3              // load weights: Q11
Vload    vr2,    r2,    $5              // load weights: Q12
Vload    vr3,    r2,    $7              // load weights: Q13
Vload    vr4,    r3,   $15              // load input: P71
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore   $14,    r4,   vr7              // store output:Y70,Y71,Y72,Y73

Vload    vr0,    r1,   $15              // load bias: R71
VMAC       /,   vr0,     /,  $1000b     // mac init, set bias
Vload    vr0,    r2,    $8              // load weights: Q04
Vload    vr1,    r2,   $10              // load weights: Q05
Vload    vr2,    r2,   $12              // load weights: Q06
Vload    vr3,    r2,   $14              // load weights: Q07
Vload    vr4,    r3,   $14              // load input: P70
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC       /,   vr3,   vr4,  $0011b     
Vload    vr0,    r2,    $9              // load weights: Q14
Vload    vr1,    r2,   $11              // load weights: Q15
Vload    vr2,    r2,   $13              // load weights: Q16
Vload    vr3,    r2,   $15              // load weights: Q17
Vload    vr4,    r3,   $15              // load input: P71
VMAC       /,   vr0,   vr4,  $0000b     
VMAC       /,   vr1,   vr4,  $0001b     
VMAC       /,   vr2,   vr4,  $0010b     
VMAC     vr7,   vr3,   vr4,  $0111b     
Vstore   $15,    r4,   vr7              // store output:Y74,Y75,Y76,Y77

