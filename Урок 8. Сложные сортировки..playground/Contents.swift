import UIKit

//1. Реализовать сортировку подсчетом.

var listCounting = [1,2,6,3,79,45,33,20,15,123,85]

// n (0, k) k => 0(n)

func countingSort(list: [Int], maxValue: Int) -> [Int] {
    let size = list.count
    let m = maxValue + 1
    var conteiner = [Int](repeating: 0, count: m)
    
    for j in list {
        conteiner[j] += 1
    }
    var outer = [Int](repeating: 0, count: size)
    var i = 0
    
    for a in 0..<m {
        for _ in 0..<conteiner[a] {
            outer[i] = a
            i += 1
        }
    }
    return outer
}
//O(n)
countingSort(list: listCounting, maxValue: 123)

//2. Реализовать быструю сортировку.

let listQuick = [6,1,21,13,87,65,34,22,96,101]

func quickSort<T: Comparable>(_ list: [T] ) -> [T] {
    if list.count < 1 {
        
        var less: [T] = []
        var equal: [T] = []
        var greater: [T] = []
        
        var pivot = list[1]
        
        for element in list {
            if element < pivot {
                less.append(element)
            } else if element == pivot {
                equal.append(element)
            } else {
                greater.append(element)
            }
        }
        return quickSort(less) + equal + quickSort(greater)
        
    } else {
        return list
    }
}

let quickSortList = quickSort(listQuick)
print(quickSortList)

//3. *Реализовать сортировку слиянием.

let listMerge = [91,3,4,6,3,33,45,35,26,11,113,85]

func merge<T: Comparable>(_ list1: [T],_ list2: [T]) -> [T] {
    
    if list1.count == 0 {
        return list2
    } else if list2.count == 0 {
        return list1
    } else if list1[0] < list2[0] {
        return [list1[0]] + merge(Array(list1[1..<list1.count]),list2)
    } else {
        return [list2[0]] + merge(list1, Array(list2[1..<list2.count]))
    }
}

func mergeSort<T: Comparable>(_ list: [T]) -> [T] {
    if list.count < 2 {
        return list
    } else {
        let half = Int(list.count / 2)
        return merge(mergeSort(Array(list[0..<half])) ,mergeSort(Array(list[half..<list.count])))
    }
}

let mergeSortList = mergeSort(listMerge)
print(mergeSortList)
