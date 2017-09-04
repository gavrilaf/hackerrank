//: Playground - noun: a place where people can play

import UIKit

// MARK:
extension String {
    var length: Int {
        return characters.count
    }
    
    subscript (i: Int) -> String {
        return String(characters[characters.index(characters.startIndex, offsetBy: i)])
    }
}

// MARK: Longest subsequence

func longestSubsequence(_ x: String, _ y: String) -> String {
    let m = x.length
    let n = y.length
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
    
    func assemble(_ i: Int, _ j: Int) -> String {
        if table[i][j] == 0 {
            return ""
        } else if x[i-1] == y[j-1] {
            return assemble(i - 1, j - 1) + x[i-1]
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

print(longestSubsequence("GTACCGTCA", "CATCGA"))
print(longestSubsequence("XMJYAUZ", "MZJAWXU"))
print(longestSubsequence("AGCAT", "GAC"))
print(longestSubsequence("AGC", "GA"))
print(longestSubsequence("C", "AAAAAA"))




