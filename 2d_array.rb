def hourglassSum(arr)
    
    # Define size of grid and footprint of design to search
    grid = [6, 6]
    footprint = [3, 3]

    # Calculate max number of iterations of design within grid
    iterMax = []
    grid.each_with_index { |value, index| iterMax.push(value + 1 - footprint[index].to_i) }

    # results stores the total value of each hourglass
    results = []

    # iter stores the current row and column using zero based numbering
    iter = [0, 0]
    
    # Outer loop iterates through rows, while the inner loop iterates through colomns
    while iter[0] < iterMax[0]
        # set the current column to 0
        iter[1] = 0
        # set our starting point x by multiplying the current iteration by the max width of the grid
        x = iter[0]*iterMax[0]
        while iter[1] < iterMax[1]
            # addition temporarily stores the integers of each hourglass as it's calculated
            addition = []
            # search contains a blueprint of an hourglass in relation to the grid
            search = [x, x+1, x+2, x+grid[0]+1, x+grid[0]*2, x+1+grid[0]*2, x+2+grid[0]*2]
            # use the blueprint to gather the relevant numbers into addition and then send the sum to results
            search.each { |i| addition.push(arr[i]) }
            results.push(addition.sum)
            # iterate through columns
            iter[1] += 1
            x += 1
        end
        iter[0] += 1
    end
    # return the highest sum of any hourglass
    return results.max
end
    

# Manual testing
# array = [1,2,3,1,1,1,0,4,0,4,3,2,9,6,7,1,9,3,0,9,8,6,6,0,0,0,0,-2,0,0,0,0,1,2,4,0]
# hourglassSum(array)