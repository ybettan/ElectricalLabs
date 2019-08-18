
def has_sublists(l):
    for sublist in l:
        if (isinstance(sublist, list)):
            return True

    return False


def shallow_flatten(l):

    res = []

    for x in l:
        if (not isinstance(x, list)):
            res.append(x)
        else:
            for y in x:
                res.append(y)

    return res
        

def flatten(l):
    
    while (has_sublists(l)):
        l = shallow_flatten(l)

    return l


