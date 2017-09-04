//: Playground - noun: a place where people can play

import UIKit

func lineToArray(_ s: String) -> [Int] {
    return s.components(separatedBy: " ").map{ Int(String($0))! }
}

func arrayToLine(_ a: [Int]) -> String {
    return a.reduce("", { (s, i) -> String in
        return s.isEmpty ? String(i) : s + " " + String(i)
    })
}



let lines = ["1 1 1 0 0 0",
             "0 1 0 0 0 0",
             "1 1 1 0 0 0",
             "0 0 2 4 4 0",
             "0 0 0 2 0 0",
             "0 0 1 2 4 0"]

let a = lines.map { return lineToArray($0) }

a.forEach {
    print(arrayToLine($0))
}

var max = 0

for i in 1..<5 {
    for j in 1..<5 {
        let sum = a[i][j] + a[i-1][j-1] + a[i-1][j] + a[i-1][j+1] + a[i+1][j-1] + a[i+1][j] + a[i+1][j+1]
        if sum > max {
            max = sum
        }
    }
}

print(max)


