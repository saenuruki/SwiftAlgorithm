class Solution {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        
        var zeroCountStack = [Int]()
        var isZero = false
        for num in nums {
            if num == 0 {
                if isZero {
                    zeroCountStack[zeroCountStack.count - 1] += 1
                } else {
                    zeroCountStack.append(1)
                }
                isZero = true
            } else {
                isZero = false
            }
        }

        func calcZeros(_ n: Int) -> Int { (1...n).reduce(0, +) }
        return zeroCountStack.map({ calcZeros($0) }).reduce(0, +)
    }
}
