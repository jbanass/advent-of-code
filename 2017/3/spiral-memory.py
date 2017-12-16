from math import sqrt

# Guilty...couldn't figure out the solution for this, so taken from https://www.reddit.com/r/adventofcode/comments/7h7ufl/2017_day_3_solutions/dqowbxy/

n = 289326

i = 1

while i*i<n:
    i += 2
pivots = [i*i - k*(i-1) for k in range(5)]

for p in pivots:
    dist = abs(p - n)
    if dist <= (i-1)//2:
        print(i - 1 - dist)
        break