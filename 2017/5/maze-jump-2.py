values = open('input.txt', 'r').readlines()

test = [0,3,0,1,-3]

def clean_input(values):
    for i in range(len(values)):
        if i == len(values) - 1:
            values[i] = int(values[i])
        else:
            values[i] = int(values[i][:-1])
    
    return values

def maze(values):
    count = 0
    index = 0
    try:
        while True:
            offset = values[index]

            if offset >= 3:
                values[index] -= 1
            else:
                values[index] += 1

            if offset < 0:
                index = index + offset
            else:
                index = offset + index

            count = count + 1
    except IndexError:
        return count


print(maze(clean_input(values)))