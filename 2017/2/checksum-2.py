value = [
    'oops-a-plaintext-secret'
]

def checksum(value):
    results = []
    for row in value:
        for i in range(len(row)):
            for j in range(len(row)):
                if (i == j):
                    continue
                if row[i] % row[j] == 0:
                    if (row[i] > row[j]):
                        results = results + [row[i] / row[j]]
                    else:
                        results = results + [row[j] / row[i]]
                    
                    break

        
    total = 0
    for result in results:
        total = total + result

    print(total)

if __name__ == '__main__':
    checksum(value)