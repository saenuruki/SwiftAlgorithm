class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var output = 0
        var minimumNum = prices.first!

        for i in 1..<prices.count {
            output = max(output, prices[i] - minimumNum)
            minimumNum = min(minimumNum, prices[i])
        }

        return output
    }
}
