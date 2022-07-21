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
        x =  iter[0]*grid[0]
        while iter[1] < iterMax[1]
            # addition temporarily stores the integers of each hourglass as it's calculated
            addition = []
            y = grid[0]
            # search contains a blueprint of an hourglass in relation to the grid
            search = [x, x+1, x+2, x+y+1, x+y*2, x+1+y*2, x+2+y*2]
            # use the blueprint to gather the relevant numbers into addition and then send the sum to results
            search.each { |i| addition.push(arr[i]) }
            results.push(addition.sum)
            x += 1
            # iterate through columns
            iter[1] += 1

        end
        iter[0] += 1
    end
    # print the grid
    # puts "array #{arr[0..5]}"
    # puts "array #{arr[6..11]}"
    # puts "array #{arr[12..17]}"
    # puts "array #{arr[18..23]}"
    # puts "array #{arr[24..29]}"
    # puts "array #{arr[30..35]}"

    # # print the results grid
    # puts "stuff #{results[0..3]}"
    # puts "stuff #{results[4..7]}"
    # puts "stuff #{results[8..11]}"
    # puts "stuff #{results[12..15]}"

    # return highest result
    returns results.max
end
    

# # Manual testing
# array = [1, 2, 3, 4, 5, 6, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2,3,4,5,6,7]
# hourglassSum(array)