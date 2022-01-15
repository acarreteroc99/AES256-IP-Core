#!/usr/bin/env python

# ============================================================================
# - All functions receive and return a list, whose elements are numbers expressed
# in hexadecimal format
# - Inside functions, parameters sent are converted into integers to be treated
# 
# ============================================================================

def initList(limit):

    list = []

    for index in range(0, limit):
        list.append(0)

    return list

def formatOutput(data):

    outpF = []
    outp = initList(16)

    data = "".join(data)

    for i in range(0, 16):
        if(int(data[i],16) < 16):
            outp[i] = "0" + str(data[i])
        else:
            outp[i] = data[i]

    outp = "".join(outp)
    outpF = [outp[i:i+2] for i in range(0,len(outp), 2)] 

    return outpF

def spacePrinting(list, op):


    if (op == "subs"):
        print("Substitution: ", end=" ")
    elif (op == "shf"):
        print("Shifting:     ", end=" ")
    elif (op == "mC"):
        print("mixColumns:   ", end=" ")
    elif (op == "addRK"):
        print("addRK:        ", end=" ")
    elif (op == "res"):
        print("RESULT:       ", end=" ")

    for el in list:
        print(el, end=" ")
    
    print( )

def subs(data):

    sbox =  [
              0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76
            , 0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0
            , 0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15
            , 0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75
            , 0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84
            , 0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF
            , 0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8
            , 0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2
            , 0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73
            , 0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB
            , 0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79
            , 0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08
            , 0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A
            , 0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E
            , 0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF
            , 0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
            ]

    aux = []
    outp = initList(16)

    index = 0

    for el in data:
        aux.append(hex(sbox[int(data[index], 16)]))
        aux[index] = aux[index][2:]
        index = index + 1

    for i in range(0, 16):
        if(int(aux[i],16) < 16):
            outp[i] = "0" + str(aux[i])
        else:
            outp[i] = aux[i]

    return outp 

def shifter(data):

    outAux = initList(16)
    outp = initList(16)

    outAux[0] = data[0]
    outAux[1] = data[1]
    outAux[2] = data[2]
    outAux[3] = data[3]

    outAux[4] = data[5]
    outAux[5] = data[6]
    outAux[6] = data[7]
    outAux[7] = data[4]

    outAux[8] = data[10]
    outAux[9] = data[11]
    outAux[10] = data[8]
    outAux[11] = data[9]

    outAux[12] = data[15]
    outAux[13] = data[12]
    outAux[14] = data[13]
    outAux[15] = data[14]

    return outAux

def mixColumns(data):

    Nrows = 4
    row = [0,0,0,0]
    outp = []

    temp = initList(16)

    for index in range(0, Nrows):
        # row[0] = data[index*4]; row[1] = data[(index*4)+1]; row[2] = data[(index*4)+2]; row[3] = data[(index*4)+3]; 

        row[0] = int(data[index], 16)
        row[1] = int(data[index+(Nrows*1)], 16)
        row[2] = int(data[index+(Nrows*2)], 16) 
        row[3] = int(data[index+(Nrows*3)], 16)
        
        temp[index] = hex(xtime(row[0]) ^ (xtime(row[1]) ^ row[1]) ^ row[2] ^ row[3])[3:]
        temp[index+(Nrows*1)] = hex(row[0] ^ xtime(row[1]) ^ (xtime(row[2]) ^ row[2]) ^ row[3])[3:]
        temp[index+(Nrows*2)] = hex(row[0] ^ row[1] ^ xtime(row[2]) ^ (xtime(row[3]) ^ row[3]))[3:]
        temp[index+(Nrows*3)] = hex((xtime(row[0]) ^ row[0]) ^ row[1] ^ row[2] ^ xtime(row[3]))[3:]
    
    temp = formatOutput(temp)
             
    #temp = "".join(temp)

    return temp

def xtime(num):
    if(num/128 == 0):
        return (num << 1)
    else:
        return ((num << 1) ^ int("1b", 16))

def addRK(data, key):

    Nrows = 4
    row = 0
    outp = []
    outAux = []

    keys = [key[i:i+2] for i in range(0,len(key), 2)] 

    for index in range(0, 16):
        outp.append(0)
        outAux.append(0)

    for index in range(0, 16):
        if(index % 4 == 0 and index != 0):
            row = row + 1 

        outAux[index] = hex(int(data[index], 16) ^ int(keys[index], 16))[2:] 
        #outp[Nrows*(index%4)+row] = hex(int(data[Nrows*(index%4)+row], 16) ^ int(keys[index], 16))[2:] 

    outpF = formatOutput(outAux)

    return outpF


def main():

    Nk = 8      # Initial number of 4-byte words. For AES-256 Nk is 8
    Nr = 16     # Number of rounds. For AES-256, Nr is 14
    Nb = 4

    input = "01000000020000000300000004000000"
    key = [
            "000102030405060708090a0b0c0d0e0f",
            "000102030405060708090a0b0c0d0e0f",
            "d6aa74fdd2af72fadaa678f1d6ab76fe",
            "f6633ab8f2663cbffa6f36b4f66238bb",
            "7ead9ebfac02ec4576a494b4a00fe24a",
            "1615a26ee4739ed11e1ca865e87e90de",
            "89cd832425cf6f61536bfbd5f364199f",
            "1b5676b5ff25e864e13940010947d0df",
            "21bd1d250472724457198991a47d900e",
            "52a9161ead8cfe7a4cb5be7b45f26ea4",
            "b822544bbc50260feb49af9e4f343f90",
            "d6b1637e7b3d9d043788237f727a4ddb",
            "42c1ed0bfe91cb0415d8649a5aec5b0a",
            "687f5a191342c71d24cae46256b0a9b9",
            "e512bbba1b8370be0e5b142454b74f2e",
        ]

    addRK_out = [] * 16
    subs_out = [] * 16
    shf_out = [] * 16
    mC_out = [] * 16

    print("--------------- ROUND 0 ---------------")
    addRK_out = addRK(input, key[0])
    spacePrinting(addRK_out, "addRK")

    for i in range(1, Nr-1):
        print("--------------- ROUND " + str(i) + " ---------------")
        subs_out = subs(addRK_out)
        spacePrinting(subs_out, "subs")
        #print("substitution: " + "".join(subs_out))
        shf_out = shifter(subs_out)
        spacePrinting(shf_out, "shf")
        #print("shifting:     " + "".join(shf_out))
        mC_out = mixColumns(shf_out)
        spacePrinting(mC_out, "mC")
        #print("mixColumns:   " + "".join(mC_out))
        addRK_out = addRK(mC_out, key[i])
        spacePrinting(addRK_out, "addRK")
        #print("addRK:        " + "".join(addRK_out))
        print("---------------------------------------")
    
    print("--------------- ROUND 15 ----------------")
    subs_out = subs(addRK_out)
    spacePrinting(subs_out, "subs")
    #print("substitution:     " + "".join(subs_out))
    shf_out = shifter(subs_out)
    spacePrinting(shf_out, "shf")
    #print("shifting:         " + "".join(shf_out))
    addRK_out = addRK(shf_out, key[-1])
    spacePrinting(addRK_out, "addRK")
    #print("addRK:            " + "".join(addRK_out))

    #print("RESULT:           " + "".join(addRK_out))
    spacePrinting(addRK_out, "res")
    
    

if __name__ == "__main__":
    main()