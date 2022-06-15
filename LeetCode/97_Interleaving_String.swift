// backtracking
class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
        let arrayS1 = Array(s1)
        let arrayS2 = Array(s2)
        let arrayS3 = Array(s3)
    
        func dfs(_ p1: Int, _ p2: Int, _ p3: Int) -> Bool {
            guard  p3 < s3.count else { return true }
            var isInterleave1: Bool {
                guard p1 < arrayS1.count else { return false }
                return arrayS1[p1] == arrayS3[p3] ? dfs(p1 + 1, p2, p3 + 1) : false
            }
            var isInterleave2: Bool {
                guard p2 < arrayS2.count else { return false }
                return arrayS2[p2] == arrayS3[p3] ? dfs(p1, p2 + 1, p3 + 1) : false
            }
            return isInterleave1 || isInterleave2
        }
        
        return dfs(0, 0, 0)
    }   
}
