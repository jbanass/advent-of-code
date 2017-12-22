

test = [
    0, 2, 7, 0
]

def find_max(values):
    max_val = values[0]
    index = 0
    for i in range(len(values)):
        if values[i] > max_val:
            max_val = values[i]
            index = i
    
    return (max_val, index)

def redistribute(values):
    seen = []
    while True:
        max_block, index = find_max(values)
        
        i = index + 1
        if (i > len(values)):
            i = 0

        while max_block > 0:
            for i in range(len(values)):
                if i == index:
                    if values[index] == 0:
                        values[index] += 1
                    else:
                        continue
                else:
                    values[i] += 1
                    values[index] -= 1
                    max_block -= 1
                

        if values in seen:
            print(seen)
            return len(seen)
        else:
            seen += (values)
            

print(redistribute(test))