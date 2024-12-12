value = [
    'oops-a-plaintext-secret'
]

def checksum(value):
    results = []
    for row in value:
        sorted_row = sorted(row)
        results = results + [sorted_row[-1] - sorted_row[0]]
        
    total = 0
    for result in results:
        total = total + result

    print(total)

if __name__ == '__main__':
    checksum(value)