//: Playground - noun: a place where people can play

import Foundation

/*function partition(list, left, right, pivotIndex)
    pivotValue := list[pivotIndex]
    swap list[pivotIndex] and list[right]  // Move pivot to end
    storeIndex := left
    for i from left to right-1
        if list[i] < pivotValue
            swap list[storeIndex] and list[i]
            increment storeIndex
    swap list[right] and list[storeIndex]  // Move pivot to its final place
    return storeIndex
*/

/**
// Returns the k-th smallest element of list within left..right inclusive
// (i.e. left <= k <= right).
// The search space within the array is changing for each round - but the list
// is still the same size. Thus, k does not need to be updated with each round.

 function select(list, left, right, k)
    if left = right        // If the list contains only one element,
        return list[left]  // return that element
    
    pivotIndex  := ...     // select a pivotIndex between left and right,
    // e.g., left + floor(rand() % (right - left + 1))
    
    pivotIndex  := partition(list, left, right, pivotIndex)
 
    // The pivot is in its final sorted position
    if k = pivotIndex
        return list[k]
    else if k < pivotIndex
        return select(list, left, pivotIndex - 1, k)
    else
        return select(list, pivotIndex + 1, right, k)
**/

func median(_ a: [Int]) -> Int {
    var arr = a
    
    func swap(_ i: Int, _ j: Int) {
        let t = arr[i]
        arr[i] = arr[j]
        arr[j] = t
    }
    
    func partitions(_ left: Int, _ right: Int, _ pivotIndex: Int) -> Int {
        let pivotValue = arr[pivotIndex]
        var storeIndex = left
        swap(pivotIndex, right)
        
        for i in left..<right {
            if arr[i] < pivotValue {
                swap(storeIndex, i)
                storeIndex += 1
            }
        }
        swap(right, storeIndex)
        return storeIndex
    }
    
    func select(_ left: Int, _ right: Int, _ k: Int) -> Int {
        if left == right {
            return arr[left]
        }
        
        var pivotIndex = left + (Int(arc4random()) % (right - left))
        pivotIndex = partitions(left, right, pivotIndex)
        
        if k == pivotIndex {
            return arr[k]
        } else if k < pivotIndex {
            return select(left, pivotIndex - 1, k)
        } else {
            return select(pivotIndex + 1, right, k)
        }
    }
    
    
    return select(0, arr.count-1, arr.count / 2)
    
}

func lineToArray(_ s: String) -> [Int] {
    return s.components(separatedBy: " ").map{ Int(String($0))! }
}


let s = "0 1 2 4 6 5 3"
let a = lineToArray(s)

print(median(a))


