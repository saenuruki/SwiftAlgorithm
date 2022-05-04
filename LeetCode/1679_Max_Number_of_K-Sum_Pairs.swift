class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        
        var checkDB = [Int: Int]() // key: target num, value: the stack count
        var output = 0
        
        for num in nums {
            // target num is already stacked
            if let numCount = checkDB[num] {
                output += 1
                if numCount > 1 {
                    checkDB[num] = numCount - 1
                } else {
                   checkDB[num] = nil
                }
            } else {
                // set target num
                if let targetNumCount = checkDB[k - num] {
                    checkDB[k - num] = targetNumCount + 1
                } else {
                    checkDB[k - num] = 1
                }
            }
        }
     
        return output
    }
}
