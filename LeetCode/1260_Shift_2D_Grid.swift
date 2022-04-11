class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        guard grid.count > 0, grid.first!.count > 0 else { return grid }
        let modBase = grid.first!.count
        let moveRowCount = (k / modBase) % grid.count
        let moveLeftCount = k % modBase
        
        var changeRowGrid = grid
        if moveRowCount > 0 {
            for i in 1...moveRowCount {
                let row = changeRowGrid.removeLast()
                changeRowGrid = [row] + changeRowGrid
            }
        }
        
        guard moveLeftCount > 0 else { return changeRowGrid }
        
        var output = [[Int]]()
        var moveToNextRowNums = [Int]()
        for row in changeRowGrid {
            var changeRow = moveToNextRowNums + row
            moveToNextRowNums.removeAll()
            for i in 1...moveLeftCount {
                let removedNum = changeRow.removeLast() 
                moveToNextRowNums = [removedNum] + moveToNextRowNums
            }
            output.append(changeRow)
        }
        output[0] = moveToNextRowNums + output.first!
        
        
        return output
    }
}
