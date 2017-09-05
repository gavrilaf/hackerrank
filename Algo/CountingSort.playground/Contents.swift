//: Playground - noun: a place where people can play

import UIKit

func lineToArray(_ s: String) -> [Int] {
    return s.components(separatedBy: " ").map{ Int(String($0))! }
}

func arrayToLine(_ a: [Int]) -> String {
    return a.reduce("", { (s, i) -> String in return s.isEmpty ? String(i) : s + " " + String(i) })
}

let numbers = [0, 6, 0, 6, 4]
let strings = ["ab", "cd", "ef", "gh", "ij"]

/**
# variables:
#    input -- the array of items to be sorted;
#    key(x) -- function that returns the key for item x
#    n -- the length of the input
#    k -- a number such that all keys are in the range 0..k-1
#    count -- an array of numbers, with indexes 0..k-1, initially all zero
#    output -- an array of items, with indexes 0..n-1
#    x -- an individual input item, used within the algorithm
#    total, oldCount, i -- numbers used within the algorithm

# calculate the histogram of key frequencies:
for x in input:
    count[key(x)] += 1

# calculate the starting index for each key:
total = 0
for i in range(k):   # i = 0, 1, ... k-1
    oldCount = count[i]
    count[i] = total
    total += oldCount

# copy to output array, preserving order of inputs with equal keys:
for x in input:
    output[count[key(x)]] = x
    count[key(x)] += 1

return output

**/

func countingSort(_ keys: [Int], _ values: [String]) -> ([Int], [String]) {
    var count = Array(repeating: 0, count: 100)
    keys.forEach { (key) in
        count[key] = count[key] + 1
    }
    
    var total = 0
    for i in 0..<100 {
        let old = count[i]
        count[i] = total
        total += old
    }
    
    var outK = Array(repeating: 0, count: keys.count)
    var outV = Array(repeating: "", count: keys.count)
    
    for (k, s) in zip(keys, values) {
        outK[count[k]] = k
        outV[count[k]] = s
        
        count[k] += 1
    }
    
    return (outK, outV)
}

let res = countingSort(numbers, strings)
zip(res.0, res.1).forEach { (n, s) in
    print("\(n) \(s)")
}