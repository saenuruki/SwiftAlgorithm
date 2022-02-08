class Solution {
    func addDigits(_ num: Int) -> Int {
        var input = num
        while input >= 10 {
            input = devideAndAdd(with: input)
        }
        return input
    }
    
    func devideAndAdd(with num: Int) -> Int {
        var input = num
        var output = [Int]()
        while input > 0 {
            output.append(input % 10)
            input = input / 10
        }
        return output.reduce(0, +)
    }
}
