
def collatz_sequence_length(x):

    if (x == 1):
        return 1

    if (x % 2 == 0):
        res =  1 + collatz_sequence_length(x / 2)
    else:
        res = 1 + collatz_sequence_length(3 * x + 1)

    return res


