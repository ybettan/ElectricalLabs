
grades = {"python": 99, "java": 90, "c": 90}

grades_list = [x for _, x in grades.items()]
max_grade = max(grades_list)
min_grade = min(grades_list)

print "My lowest grade this semester was {}".format(min_grade)
print "My highest grade this semester was {}".format(max_grade)

