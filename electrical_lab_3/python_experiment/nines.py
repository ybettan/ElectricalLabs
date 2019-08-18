

def get_all_possible_numbers(num_of_nines):
    '''
    compute all the number from the form (x op y)
    '''

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


def merge_dicts(dict1, dict2):
    '''
    merge the formulas of 2 dicts.
    the len of the formulas in each dict should be the same.
    the total len of a formula compounded from a formula of dict1 with a
    formula of dict2 should be 9
    '''

    res = {}

    for num1, formula1 in dict1.items():
        for num2, formula2 in dict2.items():
            res[num1 + num2] = "({} + {})".format(formula1, formula2)
            res[num1 - num2] = "({} - {})".format(formula1, formula2)
            res[num2 - num1] = "({} - {})".format(formula2, formula1)
            res[num1 * num2] = "({} * {})".format(formula1, formula2)
            if (num2 != 0 and num1 % num2 == 0):
                res[num1 / num2] = "({} / {})".format(formula1, formula2)
            if (num1 != 0 and num2 % num1 == 0):
                res[num2 / num1] = "({} / {})".format(formula2, formula1)

    return res


def nines():

    # get all the number computed with x times '9' for x = 1, ..., 9
    all_possible_numbers = {}
    all_possible_numbers[1] = get_all_possible_numbers(1)
    all_possible_numbers[2] = get_all_possible_numbers(2)
    all_possible_numbers[3] = get_all_possible_numbers(3)
    all_possible_numbers[4] = get_all_possible_numbers(4)
    all_possible_numbers[5] = get_all_possible_numbers(5)
    all_possible_numbers[6] = get_all_possible_numbers(6)
    all_possible_numbers[7] = get_all_possible_numbers(7)
    all_possible_numbers[8] = get_all_possible_numbers(8)
    all_possible_numbers[9] = get_all_possible_numbers(9)

    # compute all the combination of x op y for len(x) + len(y) == 9
    merged = []
    merged.append(merge_dicts({}, all_possible_numbers[9]))
    merged.append(merge_dicts(all_possible_numbers[1], all_possible_numbers[8]))
    merged.append(merge_dicts(all_possible_numbers[2], all_possible_numbers[7]))
    merged.append(merge_dicts(all_possible_numbers[3], all_possible_numbers[6]))
    merged.append(merge_dicts(all_possible_numbers[4], all_possible_numbers[5]))

    # build the dict that holds all the formulas possible
    all_combinations = {}
    for i in range(len(merged)):
        for k, v in merged[i].items():
            all_combinations[k] = v

    first_non_existing = 1

    # find the first non-existing number in the dict
    while (True):

        if (not first_non_existing in all_combinations):
            break

        first_non_existing += 1
        
    # build a new dict that contains only the values 1, ..., first_non_existing - 1
    res = {}
    for i in range(1, first_non_existing):
        res[i] = all_combinations[i]

    return res

