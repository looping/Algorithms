// http://en.wikipedia.org/wiki/Sorting_algorithm#Heapsort


// Sorting data
var originalList = [1, 1, 0, 0, 0, 0, 1, 9, 4, 9, 1, 0, 0, 1, 2, 3, 5, 6]


// Compare function
func compare(value1:Int, value2:Int) -> Bool {
    return value1 > value2
}

// Calculate leaf index, start from 0
func left(i:Int) -> Int {
    return (i + 1) << 1 - 1
}

func right(i:Int) -> Int {
    return (i + 1) << 1
}

// Sift Down
func siftDown(inout list:[Int], start:Int, end:Int) {
    var li = left(start), ri = right(start), si = start
    
    if end >= li && compare(list[start], list[li]) {
        si = li
    }
    
    if end >= ri && compare(list[si], list[ri]) {
        si = ri
    }
    
    if si != start {
        swap(&list[start], &list[si])
        siftDown(&list, si, end)
    }
}

// Heapify
func heapify(inout list:[Int]) {
    var count = list.count
    for  var i = count >> 1 - 1; i >= 0; i-- {
        siftDown(&list, i, count - 1)
    }
}

// Heapsort
func heapsort(inout list:[Int]) {
    var count = list.count
    heapify(&list)
    swap(&list[count - 1], &list[0])
    
    for var i = count - 2; i > 0; i-- {
        siftDown(&list, 0, i)
        swap(&list[i], &list[0])
    }
}

heapsort(&originalList)

originalList
