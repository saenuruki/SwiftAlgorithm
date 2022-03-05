class Solution {
    
    func deleteAndEarn(_ nums: [Int]) -> Int {
        
        // 1. convert array into dictionary
        var numsDB = [Int: Int]()
        nums.forEach { num in
            if let value = numsDB[num] {
                numsDB[num] = value + 1
            } else {
                numsDB[num] = 1
            }
        }
        
        // 2. Greading Algorithem
        return greadingAlgorithem(numsDB: numsDB, point: 0)
    }

    func greadingAlgorithem(numsDB: [Int: Int], point: Int) -> Int {
        
        guard numsDB.keys.count > 0 else { return point }

        let maxNum: Int = numsDB.keys.max()!
        
        // pick case
        var pickCaseNumsDB = numsDB
        if let value = pickCaseNumsDB[maxNum] {
            pickCaseNumsDB[maxNum] = value - 1 == 0 ? nil : value - 1
        }
        pickCaseNumsDB[maxNum - 1] = nil
        let pickCase = greadingAlgorithem(numsDB: pickCaseNumsDB, point: point + maxNum)
        
        // skip case
        var skipCaseNumsDB = numsDB
        var skipCase = 0
        if let value = skipCaseNumsDB[maxNum - 1] {
            skipCaseNumsDB[maxNum] = nil
            skipCaseNumsDB[maxNum - 1] = value - 1 == 0 ? nil : value - 1
            skipCase = greadingAlgorithem(numsDB: skipCaseNumsDB, point: point + maxNum - 1)
        }
        
        return max(pickCase, skipCase)
    }
}
