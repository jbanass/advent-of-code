values = open('input.txt', 'r').readlines()

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
            new_index = values[index]
            values[index] = new_index + 1
            
            if new_index > 0:
                index = index + new_index
            else:
                index = new_index + index

            count = count + 1
    except IndexError:
        return count


print(maze(clean_input(values)))