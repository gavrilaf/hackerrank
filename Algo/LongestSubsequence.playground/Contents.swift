//: Playground - noun: a place where people can play

import UIKit

func longestSubsequence(_ x: [Int], _ y: [Int]) -> [Int] {
    let m = x.count
    let n = y.count
    var table = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    
    func buildTable() {
        for i in 1...m {
            for j in 1...n {
                if x[i-1] == y[j-1] {
                    table[i][j] = table[i-1][j-1] + 1
                } else {
                    table[i][j] = max(table[i][j-1], table[i-1][j])
                }
            }
        }
    }
    
    func assemble(_ i: Int, _ j: Int) -> [Int] {
        if table[i][j] == 0 {
            return []
        } else if x[i-1] == y[j-1] {
            var arr = assemble(i - 1, j - 1)
            arr.append(x[i-1])
            return arr
        } else {
            if table[i][j-1] > table[i-1][j] {
                return assemble(i, j-1)
            } else {
                return assemble(i-1, j)
            }
        }
    }
    
    buildTable()
    return assemble(m, n)
}

func lineToArray(_ s: String) -> [Int] {
    return s.components(separatedBy: " ").map{ Int(String($0))! }
}

func arrayToLine(_ a: [Int]) -> String {
    return a.reduce("", { (s, i) -> String in
        return s.isEmpty ? String(i) : s + " " + String(i)
    })
}

let x = [1, 2, 3, 4, 1]
let y = [3, 4, 1, 2, 1, 3]

let s = longestSubsequence(x, y)
print(arryaToLine(s))