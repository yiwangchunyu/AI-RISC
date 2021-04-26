# -*- coding: utf-8 -*-
# @Author: WangChunyu
# @Date:   2021-04-20 20:13:17
# @Last Modified by:   yiwangchunyu
# @Last Modified time: 2021-04-20 20:13:39
import os

asmFileName='anwser1.asm'
if os.path.exists(asmFileName):
        os.remove(asmFileName)

def codePrintf(s1,s2,s3,s4,s5='',cmt=''):
    with open(asmFileName, 'a+') as f:
        if len(cmt) > 0:
            cmt = '// ' + cmt
        f.write("{:<6s}{:>6s},{:>6s},{:>6s}{}{:>8s}     {}\n".format(s1,s2,s3,s4,',' if len(s5)>0 else ' ', s5, cmt))

def codePrintfEmpty(cmt=''):
    with open('anwser1.asm', 'a+') as f:
        f.write(cmt+'\n')

codePrintf('MOV','r1','$0','[AB]','$0',cmt='address bias (C)R')
codePrintf('MOV','r2','$0','[AW]','$0',cmt='address weights (B)Q')
codePrintf('MOV','r3','$0','[AX]','$0',cmt='address input  X (A)P')
codePrintf('MOV','r4','$0','[AY]','$0',cmt='address output Y = AB+C')
codePrintfEmpty()

for i in range(8):
    for j in range(2):
        codePrintf('Vload','vr0','r1','$'+str(i*2+j),cmt='load bias: R%d%d'%(i,j))
        codePrintf('VMAC', '/', 'vr0', '/',  '$1000b',cmt='mac init, set bias')
        for k in range(4):
            codePrintf('Vload', 'vr'+str(k), 'r2', '$' + str(2*k+8*j),cmt='load weights: Q%d%d'%(0,4*j+k))
        codePrintf('Vload', 'vr4', 'r3', '$' + str(i*2),cmt='load input: P%d%d'%(i,0))
        codePrintf('VMAC', '/', 'vr0', 'vr4', '$0000b')
        codePrintf('VMAC', '/', 'vr1', 'vr4', '$0001b')
        codePrintf('VMAC', '/', 'vr2', 'vr4', '$0010b')
        codePrintf('VMAC', '/', 'vr3', 'vr4', '$0011b')
        for k in range(4):
            codePrintf('Vload', 'vr'+str(k), 'r2', '$' + str(2*k+8*j+1),cmt='load weights: Q%d%d'%(1,4*j+k))
        codePrintf('Vload', 'vr4', 'r3', '$' + str(i * 2 + 1),cmt='load input: P%d%d'%(i,1))
        codePrintf('VMAC', '/', 'vr0', 'vr4', '$0000b')
        codePrintf('VMAC', '/', 'vr1', 'vr4', '$0001b')
        codePrintf('VMAC', '/', 'vr2', 'vr4', '$0010b')
        codePrintf('VMAC', 'vr7', 'vr3', 'vr4', '$0111b')
        codePrintf('Vstore','$'+str(i*2+j),'r4','vr7',cmt='store output:Y%d%d,Y%d%d,Y%d%d,Y%d%d'%(i,j*4+0,i,j*4+1,i,j*4+2,i,j*4+3,))
        codePrintfEmpty()



