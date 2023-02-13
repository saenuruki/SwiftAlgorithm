class Solution {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        if low % 2 == 1 || high % 2 == 1 {
            return (high - low) / 2 + 1
        } else {
            return (high - low) / 2 
        }
    }
}
