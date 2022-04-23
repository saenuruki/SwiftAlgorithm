// Time: O(N)
// Space: O(3)
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        var maxPrice = prices.first!
        var minPrice = prices.first!
        var output = maxPrice - minPrice
        
        for price in prices {
            if price < minPrice {
                output = max(output, maxPrice - minPrice)
                minPrice = price
                maxPrice = price
            } else {
                maxPrice = max(maxPrice, price)
                output = max(output, maxPrice - minPrice)
            }
        }
        
        return output
    }
}

