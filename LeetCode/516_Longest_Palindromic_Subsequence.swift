// DFS + BackTracking
class Solution {
    
    var cache = [String: Int]() // key: string, value: max palindromic length

    func longestPalindromeSubseq(_ s: String) -> Int {        
        return dfs(s)
    }
    
    func dfs(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        guard cache[s] == nil else { return cache[s] ?? 0 }
        guard !isPalindrone(s) else { return s.count }
        var maxLength = 0
        for i in 0..<s.count {
            var sArray = Array(s)
            sArray.remove(at: i)
            maxLength = max(maxLength, dfs(String(sArray)))
        }
        cache[s] = maxLength
        return maxLength
    }
    
    func isPalindrone(_ s: String) -> Bool {
        return s == String(s.reversed())
    }
}
