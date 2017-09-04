//: Playground - noun: a place where people can play

import UIKit

// MARK: Array left rotation

func leftRotate(_ a: [Int], _ k: Int) -> [Int] {
    var arr = a
    let kk = k % arr.count
    
    arr[0..<kk].reverse()
    arr[kk...arr.count-1].reverse()
    arr.reverse()
    
    return arr
}

let aa = [1,2,3,4,5,6,7,8,9,10]
print(leftRotate(aa, 12))

// MARK: Anagrams

func makeAnagram(_ s1: String, _ s2: String) -> Int {
    var lt = Dictionary<Character, Int>()
    
    s1.characters.forEach { lt[$0] = (lt[$0] ?? 0) + 1 }
    s2.characters.forEach { lt[$0] = (lt[$0] ?? 0) - 1 }
    
    return lt.values.reduce(0) { (s, i) -> Int in return s + abs(i)}
}

print(makeAnagram("cde", "abc"))


