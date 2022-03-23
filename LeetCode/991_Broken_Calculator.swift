class Solution {
    func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
        
        var currentValue = target 
        var count = 0
        while currentValue != startValue {
            if currentValue < startValue {
                currentValue = currentValue + 1
            } else if currentValue%2 == 1 {
                currentValue = currentValue + 1
            } else {
                currentValue = currentValue / 2
            }
            
            count += 1
        }
        
        return count
    }
}

