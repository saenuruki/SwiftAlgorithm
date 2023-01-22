class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        
        let aBinary = Array(a.reversed()).compactMap({ Int(String($0)) })
        let bBinary = Array(b.reversed()).compactMap({ Int(String($0)) })
        var isIncriment = 0
        var output = [Int]()
        for i in 0..<max(aBinary.count, bBinary.count) {
            if i >= aBinary.count {
                output.append((bBinary[i] + isIncriment) % 2)
                isIncriment = (bBinary[i] + isIncriment) >= 2 ? 1 : 0
            } else if i >= bBinary.count {
                output.append((aBinary[i] + isIncriment) % 2)
                isIncriment = (aBinary[i] + isIncriment) >= 2 ? 1 : 0
            } else {
                output.append((aBinary[i] + bBinary[i] + isIncriment) % 2)
                isIncriment = (aBinary[i] + bBinary[i] + isIncriment) >= 2 ? 1 : 0
            }
        }
        if isIncriment == 1 {
            output.append(1)
        }
        return output.map({ String($0) }).reversed().reduce("", +)
    }
}
