
def get_dividers(x):

    res = []

    for i in range(x)[1:]:
        if (x % i == 0):
            res += [i]

    return res

def is_perfect_num(x):

    dividers = get_dividers(x)
    return sum(dividers) == x

