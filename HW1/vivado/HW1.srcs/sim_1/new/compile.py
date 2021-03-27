import re

def itob(x:int, width:int):
    s = bin(x)[2:]
    s=s.rjust(width, '0')
    return s

def process_line(line:str):
    line=line.upper().strip()
    bcode=''
    if line.startswith('LOAD'):
        opcode='001'
        line=line[4:].strip()
        rd,_,_,rs,_,_,imm,_ = re.search('^R(\d+)(\s*),(\s*)R(\d+)(\s*),(\s*)\$(\d+)(.*)$',line).groups()
        bcode='%s%s%s%s'%(itob(int(imm),5),itob(int(rs),4),itob(int(rd),4),opcode)
        return bcode+'\n'
    elif line.startswith('STORE'):
        opcode='010'
        line = line[5:].strip()
        _, _, rs1, _, _, rs2, _= re.search('^/(\s*),(\s*)R(\d+)(\s*),(\s*)R(\d+)(.*)$', line).groups()
        bcode = '%s%s%s%s' % (itob(int(rs2), 5), itob(int(rs1), 4), itob(0, 4), opcode)
        return bcode + '\n'
    elif line.startswith('MOV'):
        opcode='011'
        line = line[3:].strip()
        rd, _, _, imm, _= re.search('^R(\d+)(\s*),(\s*)\$(\d+)(.*)$', line).groups()
        bcode = '%s%s%s' % (itob(int(imm), 9), itob(int(rd), 4), opcode)
        return bcode + '\n'
    elif line.startswith('MAC'):
        opcode='100'
        line = line[3:].strip()
        _,funct,_=re.search('^(.*)\$(\d+)(.*)$',line).groups()
        funct=int(funct)
        rs2='0'
        rs1='0'
        if(funct==1):
            rd, _, _, rs1, _ = re.search('^R(\d+)(\s*),(\s*)R(\d+)(.*)$', line).groups()
        elif(funct==0):
            rd, _, _, rs1, _, _, rs2, _ = re.search('^R(\d+)(\s*),(\s*)R(\d+)(\s*),(\s*)R(\d+)(.*)$', line).groups()
        else:
            pass
        bcode = '%s%s%s%s%s' % (itob(funct, 1), itob(int(rs2), 4), itob(int(rs1), 4), itob(int(rd), 4), opcode)
        return bcode + '\n'
    else:
        pass
    return bcode

def compile(sfilename:str,bfilename:str):
    fb=open(bfilename,'w')
    with open(sfilename,'r') as fs:
        line_num=1
        for line in fs:
            try:
                bcode=process_line(line)
            except:
                print('Errors in line %d: %s'%(line_num,line))
                fb.close()
                exit(-2)
            end='\n' if len(bcode)<16 else ''
            print("%-3d:  %s"%(line_num,bcode),end=end)
            fb.write(bcode)
            line_num+=1
    fb.close()

if __name__=="__main__":
    compile("code.asm","inst_mem.txt")