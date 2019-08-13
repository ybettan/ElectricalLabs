
grades = {"python": 99, "java": 90, "c": 90}

size = len(grades)
sum = 0
for _, val in grades.items():
    sum += val

print sum / size
