class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 else { return 1 }
        var result = [Int](repeating: 0, count: amount + 1)
        result[0] = 1
        for coin in coins {
            for i in 1...amount {
                if coin<=i { result[i] += result[i - coin] }                
            }
        }
        
        return result[amount]
    }
}
