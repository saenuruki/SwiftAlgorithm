class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        
        let minLength = strs.map({ $0.count }).min()!
        let strsArray = strs.map({ Array($0).map({String($0)}) })
        var output = ""
        for i in 0..<minLength {
            let firstChar = strsArray.first![i]
            let commonCount = strsArray.filter({ $0[i] == firstChar }).count
            if commonCount == strs.count {
                output += firstChar
            } else {
                break
            }
        }
        
        return output
    }
}
