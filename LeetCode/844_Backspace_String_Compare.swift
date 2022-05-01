class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        return makeRemovedString(s) == makeRemovedString(t)
    }
    
    func makeRemovedString(_ str: String) -> String {
        var output: String = ""
        
        for char in str {
            if char == "#" {
                if !output.isEmpty { output.removeLast() }
            } else {
                output.append(String(char))
            }
        }
        return output
    }
}
