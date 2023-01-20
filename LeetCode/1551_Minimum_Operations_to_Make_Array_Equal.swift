class Solution {
    func minOperations(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        let digit = n / 2 
        let isOdd = n % 2 == 1
        return stride(from: 1, through: 2 * digit - 1, by: 2)
            .map({ isOdd ? $0 + 1 : $0 })
            .reduce(0, +)
    }
}
