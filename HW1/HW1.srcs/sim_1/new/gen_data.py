import numpy as np
def itob(x:int, width:int):
    s = bin(x)[2:]
    s=s.rjust(width, '0')
    return s

b = input('input bias:')
xs = input('input xs from x1~xn seprated by space:')
ws = input('input ws from w1~wn seprated by space:')
b=int(b)
xs=list(map(int,xs.split()))
ws=list(map(int,ws.split()))

with open('data_mem.txt','w') as f:
    f.write(itob(b,16)+'\n')
    for x in xs:
        f.write(itob(x, 16) + '\n')
    for w in ws:
        f.write(itob(w, 16) + '\n')

# compute mac result
res=b+np.dot(xs,ws)
print('b+xs.dot(ws) = %d'%res)
