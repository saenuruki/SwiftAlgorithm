class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        
        // 1. Make HashMap
        var db = [Int: Int]()
        for num in nums {
            db[num, default: 0] += 1
        }
        
        // 2. Check Validations
        let sortedKeys = db.keys.sorted()
        for key in sortedKeys {
            guard let count = db[key], count > 0 else { continue }
            for i in 0..<count {
                // check validation
                guard 
                    let updatedCount = db[key], 
                    let nextCount = db[key + 1], 
                    let nextNextCount = db[key + 2] 
                else { return false }
                guard updatedCount <= nextCount && nextCount <= nextNextCount else { return false }
                db[key, default: 0] -= 1
                db[key + 1, default: 0] -= 1
                db[key + 2, default: 0] -= 1
                var pointer = key + 3
                while let furtherCount = db[pointer], furtherCount > (db[pointer - 1] ?? Int.max) {
                    db[pointer, default: 0] -= 1
                    pointer += 1
                }
            }
        }
        return true
    }
}
