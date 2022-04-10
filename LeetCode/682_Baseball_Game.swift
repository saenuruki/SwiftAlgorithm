class Solution {
    func calPoints(_ ops: [String]) -> Int {
        
        var stack = [Int]()
        
        for op in ops {
            if let num = Int(op) {
                stack.append(num)   
            } else if op == "+" {
                let lastIndex = stack.count - 1
                let addNum = stack[lastIndex - 1] + stack[lastIndex]
                stack.append(addNum) 
            } else if op == "D" {
                let lastNum = stack.last! * 2
                stack.append(lastNum)
            } else if op == "C" {
                stack.removeLast()
            }
        }
        
        return stack.reduce(0, +)
    }
}
