

def get_all_possible_numbers(num_of_nines):

    if (num_of_nines == 1):
        return {9 : "9"}

    res = get_all_possible_numbers(num_of_nines - 1)
    new_res = {}

    for num, formula in res.items():

        new_res[num + 9] = "({} + 9)".format(formula)
        new_res[num - 9] = "({} - 9)".format(formula)
        new_res[num * 9] = "({} * 9)".format(formula)
        if (num % 9 == 0):
            new_res[num / 9] = "({} / 9)".format(formula)

        new_res[9 - num] = "(9 - {})".format(formula)
        if (num != 0 and 9 % num == 0):
            new_res[9 / num] = "(9 / {})".format(formula)

    return new_res


def nines():

    all_possible_numbers = get_all_possible_numbers(9)
    first_non_existing = 1

    while (True):

        if (not first_non_existing in all_possible_numbers):
            break

        first_non_existing += 1
        
    print "first_non_existing = {}".format(first_non_existing)

    res = {}
    for i in range(1, first_non_existing):
        res[i] = all_possible_numbers[i]

    return res





