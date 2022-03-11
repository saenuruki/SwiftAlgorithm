// Time: O(NlogN)
// Spacec: O(1)

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        //O(N)
        for row in matrix {
            if row.first! <= target && row.last! >= target {
                return binarySearch(list: row, target: target, first: 0, last: row.count - 1)
            }
        }
        return false
    }
    
    // O(logN)
    func binarySearch(list: [Int], target: Int, first: Int, last: Int) -> Bool {
        guard last - first > 1 else { return list[first] == target || list[last] == target }
        let middle = (last - first) / 2 + first
        if target <= list[middle] {
            return binarySearch(list: list, target: target, first: first, last: middle) 
        } else {
            return binarySearch(list: list, target: target, first: middle, last: last)
        }
    }
}
