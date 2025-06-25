import random

sizes = [1, 2, 3, 4]

keystring = """
radix 111111111111111111111111111111111
io iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
vname a00_3 a00_2 a00_1 a00_0 b00_3 b00_2 b00_1 b00_0 a01_3 a01_2 a01_1 a01_0 b10_3 b10_2 b10_1 b10_0 a02_3 a02_2 a02_1 a02_0 b20_3 b20_2 b20_1 b20_0 a03_3 a03_2 a03_1 a03_0 b30_3 b30_2 b30_1 b30_0 rst

tunit ps
trise tris
tfall tfall
period tper

idelay 50

vih vdd_val
vil 0

000000000000000000000000000000000
{0}000000000000000000000000000000000
000000000000000000000000000000001


"""

numupbound = 7
numlowbound = -8

mat1 = []
mat2 = []

def generate_random_matrix(m1, m2):
    tstring = ""
    size_list = random.choices(population = sizes, k = 3)

    for i in range(0, size_list[0], 1):
        templist = []
        for j in range(0, size_list[1], 1):
            templist += [random.randrange(numlowbound, numupbound)]
        m1.append(templist)

    for i in range(0, size_list[1], 1):
        templist = []
        for j in range(0, size_list[2], 1):
            templist += [random.randrange(numlowbound, numupbound)]
        m2.append(templist)
    print(m1)
    print(m2)

    i = 0
    while(True):
        tempstring = ""
        count = 0
        try:
            tempstring += format(m1[0][i] & 0b1111, '04b')
        except:
            tempstring += format(0, '04b')
            count += 1
        
        try:
            tempstring += format(m2[i][0] & 0b1111, '04b')
        except:
            tempstring += format(0, '04b')
            count += 1

        try:
            if (i - 1 >= 0):
                tempstring += format(m1[1][i - 1] & 0b1111, '04b') 
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1
        
        try:
            if (i - 1 >= 0):
                tempstring += format(m2[i - 1][1] & 0b1111, '04b') 
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1

        try:
            if (i - 2 >= 0):
                tempstring += format(m1[2][i - 2] & 0b1111, '04b')
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1
        
        try:
            if (i - 2 >= 0):
                tempstring += format(m2[i - 2][2] & 0b1111, '04b')
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1

        try:
            if (i - 3 >= 0):
                tempstring += format(m1[3][i - 3] & 0b1111, '04b')
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1
        
        try:
            if (i - 3 >= 0):
                tempstring += format(m2[i - 3][3] & 0b1111, '04b')
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1

        tempstring += "1\n"

        if (count == 8):
            break
        tstring += tempstring
        i += 1

    print(keystring.format(tstring))


def generate_sized_matrix(m1, m2, m, n, p):
    tstring = ""
    for i in range(0, m, 1):
        templist = []
        for j in range(0, n, 1):
            templist += [random.randrange(numlowbound, numupbound)]
        m1.append(templist)

    for i in range(0, n, 1):
        templist = []
        for j in range(0, p, 1):
            templist += [random.randrange(numlowbound, numupbound)]
        m2.append(templist)
    print(m1)
    print(m2)
    
    i = 0
    while(True):
        tempstring = ""
        count = 0
        try:
            tempstring += format(m1[0][i] & 0b1111, '04b')
        except:
            tempstring += format(0, '04b')
            count += 1
        
        try:
            tempstring += format(m2[i][0] & 0b1111, '04b')
        except:
            tempstring += format(0, '04b')
            count += 1

        try:
            if (i - 1 >= 0):
                tempstring += format(m1[1][i - 1] & 0b1111, '04b') 
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1
        
        try:
            if (i - 1 >= 0):
                tempstring += format(m2[i - 1][1] & 0b1111, '04b') 
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1

        try:
            if (i - 2 >= 0):
                tempstring += format(m1[2][i - 2] & 0b1111, '04b')
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1
        
        try:
            if (i - 2 >= 0):
                tempstring += format(m2[i - 2][2] & 0b1111, '04b')
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1

        try:
            if (i - 3 >= 0):
                tempstring += format(m1[3][i - 3] & 0b1111, '04b')
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1
        
        try:
            if (i - 3 >= 0):
                tempstring += format(m2[i - 3][3] & 0b1111, '04b')
            else:
                tempstring += format(0, '04b')
                count += 1
        except:
            tempstring += format(0, '04b')
            count += 1

        tempstring += "1\n"

        if (count == 8):
            break
        tstring += tempstring
        i += 1

    print(keystring.format(tstring))

            

        
#generate_random_matrix(mat1, mat2)
generate_sized_matrix(mat1, mat2, 4, 4, 4)

