// http://en.wikipedia.org/wiki/Sorting_algorithm#Comb_sort


// Sorting data
var originalList = [1, 1, 0, 0, 0, 0, 1, 9, 4, 9, 1, 0, 0, 1, 2, 3, 5, 6]


// Compare function
func compare(value1:Int, value2:Int) -> Bool {
    return value1 < value2
}


// Comb sort
func combSort(inout list:[Int]) {
    var gap = list.count
    var shrink = 1.3
    var swapped = false
    do {
        gap = Int(Double(gap) / shrink)
        if gap < 1 {
            gap = 1
        }
        
        swapped = false
        for var i = 0; i + gap < list.count; i++ {
            if compare(list[i], list[i + gap]) {
                swap(&list[i], &list[i + gap])
                swapped = true
            }
        }
    } while swapped || gap != 1
    
}


// Test
combSort(&originalList)
originalList