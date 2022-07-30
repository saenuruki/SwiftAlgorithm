class Solution {
    func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
        var max2Array = count("")
        for str in words2 {
            var count2 = count(str)
            for i in 0..<26 {
                max2Array[i] = max(max2Array[i], count2[i])
            }
        }
        
        var output = [String]()
        main: for str in words1 {
            let count1 = count(str)
            for i in 0..<26 {
                if count1[i] < max2Array[i] { continue main }
            }
            output.append(str)
        }
        return output
    }
    
    func count(_ str: String) -> [Int] {
        var answer = Array(repeating: 0, count: 26)
        for char in str {
            let index = char.ascii - Character("a").ascii
            answer[index] += 1
        }
        return answer
    }
}

extension Character {
    var ascii: Int {
        return Int(unicodeScalars.first!.value)
    }
}
