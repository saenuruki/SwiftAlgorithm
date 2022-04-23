class Solution {
    func maxProduct(_ nums: [Int]) -> Int {

        var splitNums: [(nums: [Int], hasMinus: Bool)] {
            var tempNums = [Int]()
            var hasMinus = false
            var outputNums: [(nums: [Int], hasMinus: Bool)] = []
            for num in nums {
                if num == 0 {
                    if tempNums.count > 0 { outputNums.append((nums: tempNums, hasMinus: hasMinus)) }
                    outputNums.append((nums: [0], hasMinus: false))
                    tempNums = []
                    hasMinus = false
                } else {
                    if num < 0 { hasMinus = !hasMinus }
                    tempNums.append(num)
                }
            }
            if !tempNums.isEmpty { outputNums.append((nums: tempNums, hasMinus: hasMinus)) }
            return outputNums
        }
        
        var output = -10
        
        for tuple in splitNums {
            if tuple.hasMinus && tuple.nums.count == 1 {
                output = max(output, tuple.nums.first!)
            } else if tuple.hasMinus {
                var firstMinusIndex = 0
                while tuple.nums[firstMinusIndex] > 0 {
                    firstMinusIndex += 1
                }
                firstMinusIndex += 1
                
                var lastMinusIndex = tuple.nums.count - 1
                while tuple.nums[lastMinusIndex] > 0 {
                    lastMinusIndex -= 1
                }
                
                let firstProduct = tuple.nums[firstMinusIndex..<tuple.nums.count].reduce(1, *)
                let lastProduct = tuple.nums[0..<lastMinusIndex].reduce(1, *)
                let subMaxProduct = max(firstProduct, lastProduct)
                output = max(output, subMaxProduct)
            } else {
                let product = tuple.nums.reduce(1, *)
                output = max(output, product)
            }
        }
        
        return output
        
    }
}
