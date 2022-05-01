class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        // Dynamic Programing
        // memo each minimum count
        var result = [Int](repeating: amount + 1, count: amount + 1)
        result[0] = 0
        for i in 1...amount {
            for c in coins {
                if c<=i {
                    result[i] = min(result[i], result[i - c] + 1)
                }
            }
        }
        
       return result[amount] > amount ? -1 : result[amount]
    }
}
