test = [
    [
        5,
        1,
        9,
        5
    ],
    [
        7,
        5,
        3
    ],
    [
        2,
        4,
        6,
        8
    ]
]

def checksum(value):
    for row in value:
        sorted_row = sorted(row)
        result = sorted_row[-1] - sorted_row[0]
        print(result)

checksum(test)