class Solution {
    func digitSum(_ s: String, _ k: Int) -> String {
        
        var output = s
        while output.count > k {
            let digits = makeDigits(output, k)
            output = digits.map({ String($0) }).reduce("", +)
            
        }
        return output
    }
    
    func makeDigits(_ s: String, _ k: Int) -> [Int] {
        guard k > 0 else { return [] }
        var digits = [Int]()
        let sArray = Array(s)
        let count = sArray.count % k == 0 ? sArray.count / k : sArray.count / k + 1
        for i in 0..<count {
            let startIndex = k * i
            let endIndex = min(sArray.count, startIndex + k)            
            let subArray = sArray[startIndex..<endIndex]
            
            let digit = subArray.map({ Int(String($0))! }).reduce(0, +)
            digits.append(digit)
        }

        return digits
    }
}
