class Solution {
    func maxArea(_ h: Int, _ w: Int, _ horizontalCuts: [Int], _ verticalCuts: [Int]) -> Int {
        var maxH = 0
        var maxW = 0
        
        let sortedHCuts = horizontalCuts.sorted(by: <)
        for i in 0..<sortedHCuts.count {
            if i == 0 {
                maxH = max(maxH, sortedHCuts[i])
            } else {
                maxH = max(maxH, sortedHCuts[i] - sortedHCuts[i - 1])
            }
        }
        maxH = max(maxH, h - sortedHCuts.last!)

        let sortedWCuts = verticalCuts.sorted(by: <)
        for i in 0..<sortedWCuts.count {
            if i == 0 {
                maxW = max(maxW, sortedWCuts[i])
            } else {
                maxW = max(maxW, sortedWCuts[i] - sortedWCuts[i - 1])
            }
        }
        maxW = max(maxW, w - sortedWCuts.last!)
                
        let mod =  Int(pow(Double(10),Double(9))) + 7
        let result = (maxH * maxW) % mod
        return result        
    }
}
