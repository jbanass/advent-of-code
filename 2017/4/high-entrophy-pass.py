import collections

values = open('input.txt', 'r').readlines()

total_unique = 0

def check_uniqueness(value):
    global total_unique
    phrase = values[i].split(' ')
    counter = collections.Counter(phrase)
    for value in counter.values():
        if value > 1:
            total_unique = total_unique + 1
            return
        

for i in range(len(values)):
    if i == len(values) - 1:
        check_uniqueness(values[i])
        continue
    values[i] = values[i][:-1]
    check_uniqueness(values[i])
    
print(len(values) - total_unique)