// http://en.wikipedia.org/wiki/Sorting_algorithm#Merge_sort


// Sorting data
var originalList = [1, 1, 0, 0, 0, 0, 1, 9, 4, 9, 1, 0, 0, 1, 2, 3, 5, 6]
var originalList2 = originalList

// Compare function
func compare(value1:Int, value2:Int) -> Bool {
    return value1 > value2
}


// Merge
func merge(inout list:[Int], begin:Int, middle:Int, end:Int) {
    var index = begin

    var tmpListA = list[begin ... middle], tmpListB = list[middle + 1 ... end]
    var ac = tmpListA.count, bc = tmpListB.count
    var ai = 0, bi = 0
    
    do {
        if compare(tmpListA[ai], tmpListB[bi]) {
            list[index++] = tmpListA[ai++]
        } else {
            list[index++] = tmpListB[bi++]
        }
    } while ai < ac && bi < bc
    
    while ai < ac {
        list[index++] = tmpListA[ai++]
    }
    
    while bi < bc {
        list[index++] = tmpListB[bi++]
    }
}

// Top-down implementation
func topDownMergeSort(inout list:[Int], begin:Int, end:Int) {
    if end > begin {
        var middle = (begin + end) >> 1;
        topDownMergeSort(&list, begin, middle)
        topDownMergeSort(&list, middle + 1, end)
        merge(&list, begin, middle, end)
    }
}

topDownMergeSort(&originalList, 0, originalList.count - 1)

originalList


// Bottom-up implementation
func bottomUpMergeSort(inout list:[Int]) {
    var count = list.count
    for var width = 1; width < count; width <<= 1 {
        for var begin = 0; begin < count; begin += width << 1 {
            var middle = min(begin + width - 1, count - 2), end = min(begin + (width << 1) - 1, count - 1)
            if width <= end - begin {
                merge(&list, begin, middle, end)
            }
        }
    }
}

bottomUpMergeSort(&originalList2)

originalList2
