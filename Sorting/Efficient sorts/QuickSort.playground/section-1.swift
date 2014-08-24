// http://en.wikipedia.org/wiki/Sorting_algorithm#Quicksort

// Sorting data
var originalList = [1, 1, 0, 0, 0, 0, 1, 9, 4, 9, 1, 0, 0, 1, 2, 3, 5, 6]

// Compare function
func compare(value1:Int, value2:Int) -> Bool {
    return value1 > value2
}


//Generator Pivot
func genPivot(inout list:[Int], left:Int, right:Int) {
//    swap(&list[left], &list[(left + right) / 2])
//    swap(&list[left], &list[right])
}


// Partition v1
func partition1(inout list:[Int], left:Int, right:Int) -> Int {
    genPivot(&list, left, right)
    var pivotIndex = left
    var i = left, j = right
    
    for ; j > i; j-- {
        if compare(list[j], list[pivotIndex]) {
            for ; i < j; i++ {
                if compare(list[pivotIndex], list[i]) {
                    swap(&list[i], &list[j])

                    break
                }
            }
        }
    }
    
    swap(&list[pivotIndex], &list[i])
    
    return i
}


// Quick Sort
func quicksort(inout list:[Int], left:Int, right:Int) {
    if left < right {
        var posi = partition1(&list, left, right)
        quicksort(&list, left, posi - 1)
        quicksort(&list, posi + 1, right)
    }
}

func qsort(inout list:[Int]) {
    quicksort(&list, 0, list.count - 1)
}

qsort(&originalList)

