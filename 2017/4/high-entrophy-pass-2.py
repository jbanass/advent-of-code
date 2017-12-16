from collections import Counter

values = open('input.txt', 'r').readlines()

total_unique = 0

def check_uniqueness(value):
    global total_unique
    phrase = value.split(' ')
    for i in range(len(phrase)):
        for j in range(len(phrase)):
            if i == j:
                continue
            if Counter(phrase[i]) == Counter(phrase[j]):
                total_unique = total_unique + 1
                return
        

for i in range(len(values)):
    if i == len(values) - 1:
        check_uniqueness(values[i])
        continue
    values[i] = values[i][:-1]
    check_uniqueness(values[i])
    
print(len(values) - total_unique)