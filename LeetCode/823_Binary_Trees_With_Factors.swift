// class Solution {
//     func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        
//         let arrSet = Set(arr)
//         var output = arr.count
//         var cache = [Int: Int]()
        
//         func dfs(_ parent: Int) -> Int {
//             if let cached = cache[parent] { return cached }
//             var count = 0
//             for num in arr where num < parent && parent % num == 0 {
//                 if arrSet.contains(parent / num) {
//                     print("\(parent), \(num), \(parent / num)")
//                     count += 1
//                     print("\(num) ~~~~~~~~~~~")
//                     let numValue = cache[num] ?? dfs(num)
//                     print("\(parent / num) ~~~~~~~~~~~")
//                     let partnerValue = cache[parent / num] ?? dfs(parent / num)
//                     count += numValue + partnerValue
//                     count = count % 1000000007
//                 }
//             }
//             cache[parent] = count
//             return count
//         }
        
//         for num in arr {
//             print("\(num) =============================")
//             output += dfs(num)
//         }
//         print(cache)
        
//         return output
//     }
// }

// // DFS + Backtracking
class Solution {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let arr = arr.sorted(), c = arr.count, d = 1_000_000_007
        var dp = [Int: Int]()
        for i in 0..<c {
            dp[arr[i]] = 1
            for j in 0..<i where arr[i] % arr[j] == 0 {
                dp[arr[i], default: Int(0)] += dp[arr[j], default: 0] * dp[arr[i] / arr[j], default: 0]
            }
        }
        return dp.values.reduce(0, +) % d
    }
}
