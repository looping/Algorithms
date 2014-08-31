// http://en.wikipedia.org/wiki/Sorting_algorithm#Shell_sort


// Sorting data
var originalList = [1, 1, 0, 0, 0, 0, 1, 9, 4, 9, 1, 0, 0, 1, 2, 3, 5, 6]
var originalList1 = originalList
var originalList2 = originalList
var originalList3 = originalList


// Compare function
func compare(value1:Int, value2:Int) -> Bool {
    return value1 < value2
}


// Shell sort of using Bubble sort
func shellSortB(inout list:[Int]) {
    for var k = list.count / 2; k >= 1; k /= 2 {
        for var i = list.count - 1; i > 0; i-- {
            var flag = 0
            
            for var j = 1; j <= i; j += k {
                if compare(list[j - 1], list[j]) {
                    swap(&list[j - 1], &list[j])
                    
                    flag = j
                }
            }
            
            i = flag
        }
    }
}


// Shell sort of using Insertion sort
func shellSortI(inout list:[Int]) {
    for var k = list.count / 2; k >= 1; k /= 2 {
        for var i = 1; i < list.count; i += k {
            for var j = 0; j < i; j += k {
                if compare(list[j], list[i]) {
                    list.insert(list[i], atIndex: j)
                    list.removeAtIndex(i + 1)
                    break;
                }
            }
        }
    }
}


// Shell sort of using Selection sort
func shellSortS(inout list:[Int]) {
    for var k = list.count / 2; k >= 1; k /= 2 {
        for var i = 0; i < list.count - 1; i += k {
            var ri = i
            
            for var j = i + 1; j < list.count; j += k {
                if compare(list[ri], list[j]) {
                    ri = j
                }
            }
            
            if i != ri {
                swap(&list[i], &list[ri])
            }
        }
    }
}


// Test
shellSortB(&originalList)
originalList

shellSortI(&originalList1)
originalList1

shellSortS(&originalList2)
originalList2