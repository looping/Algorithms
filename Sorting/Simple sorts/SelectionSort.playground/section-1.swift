// http://en.wikipedia.org/wiki/Sorting_algorithm#Selection_sort


// Sorting data
var originalList = [1, 1, 0, 0, 0, 0, 1, 9, 4, 9, 1, 0, 0, 1, 2, 3, 5, 6]

// Compare function
func compare(value1:Int, value2:Int) -> Bool {
    return value1 < value2
}

for i in 0 ... originalList.count - 2 {
    var ri = i
    
    for j in i + 1 ... originalList.count - 1 {
        if compare(originalList[ri], originalList[j]) {
            ri = j
        }
    }
    
    if i != ri {
        swap(&originalList[i], &originalList[ri])
    }
}

originalList