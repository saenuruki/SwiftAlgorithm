class Solution {
    func integerReplacement(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        
        if n % 2 == 0 {
            return integerReplacement(n/2) + 1
        } else {
            return min(integerReplacement(n+1), integerReplacement(n-1)) + 1
        }
    }
}
