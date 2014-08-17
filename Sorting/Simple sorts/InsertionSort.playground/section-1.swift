// http://en.wikipedia.org/wiki/Sorting_algorithm#Insertion_sort


// Sorting data
var originalList = [1, 1, 0, 0, 0, 0, 1, 9, 4, 9, 1, 0, 0, 1, 2, 3, 5, 6]
var theSortedList:[Int] = [];


// Compare function
func compare(value1:Int, value2:Int) -> Bool {
    return value1 > value2
}


// Sorting to a new array
for value in originalList {
    theSortedList.append(value)
    for i in 0 ... theSortedList.count - 1 {
        if compare(value, theSortedList[i]) {
            theSortedList.insert(value, atIndex: i)
            theSortedList.removeLast()
            break;
        }
    }
}

theSortedList


// Using the original array
for i in 1 ... originalList.count - 1 {
    for j in 0 ... i - 1 {
        if compare(originalList[i], originalList[j]) {
            originalList.insert(originalList[i], atIndex: j)
            originalList.removeAtIndex(i + 1)
            break;
        }
    }
}

originalList

