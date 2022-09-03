class Solution {
    func numsSameConsecDiff(_ n: Int, _ k: Int) -> [Int] {

        var numSet: Set = [1,2,3,4,5,6,7,8,9]
        for i in 0..<(n - 1) {
            var newNumSet = Set<Int>()
            for num in numSet {
                if num % 10 + k < 10 { newNumSet.insert(num * 10 + (num % 10 + k)) }
                if num % 10 - k >= 0 { newNumSet.insert(num * 10 + (num % 10 - k)) }
            }
            numSet = newNumSet
        }
        
        return Array(numSet)
    }
}
