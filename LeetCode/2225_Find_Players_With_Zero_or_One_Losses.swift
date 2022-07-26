class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var cache = [Int: Int]() // key: player, value: lose count
        for match in matches {
            cache[match.first!] = cache[match.first!, default: 0]
            cache[match.last!] = cache[match.last!, default: 0] + 1
        }
        
        let winners = cache.filter({ $0.value == 0 }).map({ $0.key }).sorted()
        let oneLosers = cache.filter({ $0.value == 1 }).map({ $0.key }).sorted()
        return [winners, oneLosers]
    }
}
