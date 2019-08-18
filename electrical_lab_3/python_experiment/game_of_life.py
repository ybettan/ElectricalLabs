
ALIVE = 1
DEAD = 0

def allocate_matrix(nrows, ncols):
    
    mat = []

    for i in range(nrows):
        single_row = []
        for j in range(ncols):
            single_row.append(0)
        mat.append(single_row)

    return mat

    
def compute_neighbors(state, row, col):
    
    nrows = len(state)
    ncols = len(state[0])

    if (row == 0):
        if (col == 0):
            neighbors = [state[0][1], state[1][1], state[1][0]]
        elif (col == ncols - 1):
            neighbors = [state[0][row - 1], state[1][row - 1], state[1][row]]
        else:
            neighbors = [state[0][col - 1], state[1][col - 1], state[1][col],
                    state[1][col + 1], state[0][col + 1]]

    elif (row == nrows - 1):
        if (col == 0):
            neighbors = [state[row - 1][0], state[row - 1][1], state[row][1]]
        elif (col == ncols - 1):
            neighbors = [state[row][col - 1], state[row - 1][col - 1],
                    state[row - 1][col]]
        else:
            neighbors = [state[row][col - 1], state[row - 1][col - 1],
                    state[row - 1][col], state[row - 1][col + 1],
                    state[row][col + 1]]

    elif (col == 0):
            neighbors = [state[row - 1][0], state[row - 1][1], state[row][1],
                    state[row + 1][1], state[row + 1][0]]

    elif (col == ncols - 1):
            neighbors = [state[row - 1][col], state[row - 1][col - 1],
                    state[row][col - 1], state[row + 1][col - 1],
                    state[row + 1][col]]

    else:
        neighbors = [state[row - 1][col - 1], state[row - 1][col],
                state[row - 1][col + 1], state[row][col + 1],
                state[row + 1][col + 1], state[row + 1][col],
                state[row + 1][col - 1], state[row][col - 1]]

    return sum(neighbors)


def compute_new_state(state, num_neighbors_mat):

    nrows = len(state)
    ncols = len(state[0])

    new_state = allocate_matrix(nrows, ncols)

    for row in range(nrows):
        for col in range(ncols):
            num_neighbors = num_neighbors_mat[row][col]
            my_state = state[row][col]
            if (my_state == ALIVE and num_neighbors < 2):
                new_state[row][col] = DEAD
            elif (my_state == ALIVE and num_neighbors >= 2 and num_neighbors <= 3):
                new_state[row][col] = ALIVE
            elif (my_state == ALIVE and num_neighbors > 3):
                new_state[row][col] = DEAD
            elif (my_state == DEAD and num_neighbors == 3):
                new_state[row][col] = ALIVE

    return new_state


def game_of_life(state, num_steps):

    nrows = len(state)
    ncols = len(state[0])

    num_neighbors_mat = allocate_matrix(nrows, ncols)

    for row in range(nrows):
        for col in range(ncols):
            num_neighbors_mat[row][col] = compute_neighbors(state, row, col)

    new_state = compute_new_state(state, num_neighbors_mat)

    if (num_steps == 1):
        return new_state

    return game_of_life(new_state, num_steps - 1)



