#!/usr/bin/env python

# Prints the original table and the resulting one
def printRevTable(file, newLines):

    print("Original file below: ")
    for line in file:
        print(line)

    print("-------------------------------------------------")
    print("Modified file below: ")
    for line in newLines:
        print("".join(line))

# Reverses the string, where numbers are group by pairs
def reorderLine(line):
    newLine = []

    for i in range(0,32,2):
        newLine.append(line[31-(i+1)])
        newLine.append(line[31-i])
    return newLine

def main():
    file = open("rijndaelTables/key_v22.txt", "r")

    origLines = []
    aux = []
    newLines = []

    for line in file:
        origLines.append(line)
        aux = reorderLine(line)
        newLines.append(aux)
    
    printRevTable(origLines, newLines)

if __name__ ==  "__main__":
    main()
