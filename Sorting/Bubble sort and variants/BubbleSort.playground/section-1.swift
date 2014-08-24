// http://en.wikipedia.org/wiki/Sorting_algorithm#Bubble_sort

// Sorting data
var originalList = [1, 1, 0, 0, 0, 0, 1, 9, 4, 9, 1, 0, 0, 1, 2, 3, 5, 6]

// Compare function
func compare(value1:Int, value2:Int) -> Bool {
    return value1 < value2
}

// Bubble sort
func bubbleSort(inout list:[Int]) {
    for var i = list.count - 1; i > 0; i-- {
        for var j = 1; j <= i; j++ {
            if compare(list[j - 1], list[j]) {
                swap(&list[j - 1], &list[j])
            }
        }
    }
}

// Optimized bubble sort
func bubbleSortOP(inout list:[Int]) {
    for var i = list.count - 1; i > 0; i-- {
        var flag = 0
        
        for var j = 1; j <= i; j++ {
            if compare(list[j - 1], list[j]) {
                swap(&list[j - 1], &list[j])
                
                flag = j
            }
        }
        
        i = flag
    }
}

bubbleSort(&originalList)
originalList

//bubbleSortOP(&originalList)
//originalList
//
//bubbleSort(&originalList)
//originalList