import Foundation

// 0: aisle
// 1: wall

// Q1. minimum path from (0,0) to (col - 1, row - 1)
// DP & BFS

func findMinimumPath(_ matrix: [[Int]]) -> Int {

    let maxRow = matrix.count
    let maxCol = matrix.first!.count
    
    var output = [[Int]]()
    for row in matrix {
        let fixedRow = row.map { $0 == 1 ? -1 : $0 }
        output.append(fixedRow)
    }
    
    let diffX = [0,0,-1,1]
    let diffY = [-1,1,0,0]
    
    var stack = [(col: Int, row: Int)]()
    stack.append((col: 0, row: 0)) // start position
    output[0][0] = 1
    while !stack.isEmpty {
        let firstCell = stack.removeFirst()
        let cellValue = output[firstCell.row][firstCell.col]
        
        for i in 0..<4 {
            if isPossibleAccess(firstCell.row + diffY[i], firstCell.col + diffX[i], maxRow, maxCol) {
                let nextCellValue = output[firstCell.row + diffY[i]][firstCell.col + diffX[i]]
                guard nextCellValue != -1 else { continue } // that means wall
                if cellValue + 1 < nextCellValue || nextCellValue == 0 {
                    stack.append((col: firstCell.col + diffX[i], row: firstCell.row + diffY[i]))
                    output[firstCell.row + diffY[i]][firstCell.col + diffX[i]] = cellValue + 1
                }
            }
        }
    }

    return output.last!.last!
}

func isPossibleAccess(_ row: Int, _ col: Int, _ maxRow: Int, _ maxCol: Int) -> Bool {
    return row >= 0 && row < maxRow && col >= 0 && col < maxCol
}

let matrix1 = [[0,0],[1,0]]
print(findMinimumPath(matrix1)) // 3

let matrix2 = [
[0,0,1,0,0,1,1,0,0,0,0],
[1,0,1,0,0,0,1,1,0,0,0],
[0,0,1,0,1,0,1,0,1,1,1],
[0,0,1,0,1,0,1,0,0,0,0],
[0,1,1,0,1,0,1,0,0,0,0],
[0,1,0,0,1,0,1,0,1,0,0],
[0,0,0,1,0,0,0,0,1,0,0],
[0,1,1,0,0,1,0,0,1,0,0]]
print(findMinimumPath(matrix2)) // 34

let matrix3 = [
[0,0,1,0,1,1,1,0,0,0,0],
[1,0,1,0,0,0,1,1,0,0,0],
[0,0,1,0,1,0,1,0,1,1,1],
[0,0,1,0,1,0,1,0,0,0,0]]
print(findMinimumPath(matrix3)) // can't reach the goal: 0


// Q2. maximum path from (0,0) to (col - 1, row - 1)
// DP


//[01,02,**,18,19,**,**,00,00,00,00],
//[**,03,**,17,20,21,**,**,00,00,00],
//[05,04,**,16,**,22,**,34,**,**,**],
//[06,05,**,15,**,23,**,33,34,37,38],
//[07,**,**,14,**,24,**,32,35,36,39],
//[08,**,12,13,**,25,**,31,**,41,40],
//[09,10,11,**,27,26,27,30,**,42,43],
//[10,**,**,29,28,**,28,29,**,43,44]]

// Q3. minimum path from (*,0) to (*, row - 1)


// Q4. maximum path from (*,0) to (*, row - 1)


// e.g.
// 0,0,0,0,0,0,0,0,0
//

import UIKit
let view1 = UIView()
let view2 = UIView()
let view3 = UIView()
let view4 = UIView()
let stackView = UIStackView(arrangedSubviews: [view1, view2, view3, view4])
print("subviews(\(stackView.subviews.count)): \(stackView.subviews)")
print("arrangedSubviews(\(stackView.arrangedSubviews.count)): \(stackView.arrangedSubviews) \n\n\n\n\n")
stackView.arrangedSubviews[1].isHidden = true
print("subviews(\(stackView.subviews.count)): \(stackView.subviews)")
print("arrangedSubviews(\(stackView.arrangedSubviews.count)): \(stackView.arrangedSubviews)")
