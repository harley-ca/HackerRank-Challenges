def rotateLeft(d, arr)
    i = 0
    until i == d
        x = arr.shift 
        arr.push(x)
        i += 1
    end
    return arr
end