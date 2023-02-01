class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        
        guard str1 + str2 == str2 + str1 else { return "" }
        if str1.replacingOccurrences(of: str2, with: "")  == "" { return str2 }
        if str2.replacingOccurrences(of: str1, with: "")  == "" { return str1 }

        if str1.count < str2.count {
            guard str2.count % str1.count > 0 && str2.count > 0 else { return "" }
            let newStr2 = Array(str2)[0..<(str2.count % str1.count)].map({ String($0) }).reduce("",+)
            return gcdOfStrings(str1, newStr2)
        } else {
            guard str1.count % str2.count > 0 && str1.count > 0 else { return "" }
            let newStr1 = Array(str1)[0..<(str1.count % str2.count)].map({ String($0) }).reduce("",+)
            return gcdOfStrings(newStr1, str2)
        }
    }
}
