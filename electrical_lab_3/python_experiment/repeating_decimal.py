
def fraction2repeating_decimal(n, m):
    """ we can assume n < m, m != 0 """

    # compute the first digit after the dot
    res = "0."
    remnant = n
    num = remnant * 10
    digit = num / m
    res += str(digit)

    # compute the rest of the digits
    while(True):

        remnant = num % m

        # this numbe have a finite representation
        if (remnant == 0):
            return res

        num = remnant * 10
        digit = num / m
        res += str(digit)

        # this numbe have an infinite representation
        if (res[-1] == res[-2]):
            res = list(res)
            res[-2] = "("
            res.append(")")
            res = "".join(res)
            return res

        remnant = num % m


