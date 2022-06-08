class Solution {
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        
        var counter = 0
        var cacheDB = [Int: Int]() // key: num, value: count
        for num in time {
            counter += cacheDB[num % 60] ?? 0
            let key = num % 60 == 0 ? 0 : 60 - num % 60
            cacheDB[key, default: 0] += 1 
        }
        return counter
    }
}
