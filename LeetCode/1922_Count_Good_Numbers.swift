class Solution {
    func countGoodNumbers(_ n: Int) -> Int {
        var output = 5 // "0", "2", "4", "6", "8".
        guard n > 1 else { return output }
        
        for i in 1..<n {
            if i % 2 == 0 {
                output = (output * 5) % 1000000007 // "0", "2", "4", "6", "8"
            } else {
                output = (output * 4) % 1000000007 // "2", "3", "5", "7"
            }
        }
        return output
    }
}


