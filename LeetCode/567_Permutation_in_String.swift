class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s1.count <= s2.count else { return false }
        let arrayS2 = Array(s2)
        var initialDictS1 = s1.reduce([Character: Int]()) { result, word in
            var newResult = result 
            if let value = newResult[word] {
                newResult[word] = value + 1
            } else {
                newResult[word] = 1
            }
            return newResult
        }
        var dictS1 = initialDictS1
        
        // time: O(S1*S2)
        for i in 0...s2.count - s1.count {
            if dictS1[arrayS2[i]] != nil {
                for pointer in i..<s2.count {                    
                    if let value = dictS1[arrayS2[pointer]], value > 0 {
                        if value == 1 {
                            dictS1[arrayS2[pointer]] = nil
                        } else {
                            dictS1[arrayS2[pointer]] = value - 1   
                        }
                    } else { 
                        break
                    }
                    if dictS1.values.isEmpty { return true }
                }
            }
            dictS1 = initialDictS1
        }
        
        return false
    }
}
