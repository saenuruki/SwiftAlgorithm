class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var sortedCosts = costs.sorted(by: <)
        var totalCost = sortedCosts.reduce(0, +)
        while totalCost > coins {
            let removedCost = sortedCosts.removeLast()
            totalCost -= removedCost
        }
        return sortedCosts.count
    }
}
