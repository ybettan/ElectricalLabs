
def area(x1, y1, x2, y2, x3, y3):
    return abs(x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)) / 2.0

def is_origin_in_triangle (x1, y1, x2, y2, x3, y3):

    A = area(x1, y1, x2, y2, x3, y3)
    A1 = area(0, 0, x2, y2, x3, y3)
    A2 = area(x1, y1, 0, 0, x3, y3)
    A3 = area(x1, y1, x2, y2, 0, 0)

    return A == (A1 + A2 + A3)

assert(is_origin_in_triangle(1, 1, -1, -1, 1, -1)) == True
assert(is_origin_in_triangle(3, 3, 1, 1, 3, 1)) == False


