class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        var arr = nums
        var moved = false
        for i in 0..<arr.count-1 {
            if arr[i] > arr[i + 1] {
                if moved {
                    return false
                }
                if i > 0 && arr[i - 1] > arr[i + 1] {
                    arr[i + 1] = arr[i]
                }
                moved = true
            }
        }
        return true
    }
}

