class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else { return [1] }
        var row = [1, 1]
        guard rowIndex > 1 else { return row }
        
        for i in 2...rowIndex {
            var newRow = [1]
            for j in 1..<i {
                newRow.append(row[j - 1] + row[j])
            }
            newRow.append(1)
            row = newRow
        }
        return row
    }
}
