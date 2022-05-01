class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard !text1.isEmpty && !text2.isEmpty else { return 0 }
        let array1 = Array(text1)
        let array2 = Array(text2)
        
        var row = [Int](repeating: 0, count: text2.count + 1)
        var matrix = [[Int]](repeating: row, count: text1.count + 1)
        var result = 0
        
       for i in 1...array1.count {
           for j in 1...array2.count {
               matrix[i][j] = array1[i-1] == array2[j-1] ? matrix[i-1][j-1] + 1 : max(matrix[i-1][j], matrix[i][j-1])
               result = max(result, matrix[i][j])
           }
       }
       return result 
    }
}
