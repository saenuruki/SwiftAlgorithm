class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {

        var output = 0
        for code in columnTitle.unicodeScalars {
            let alphabetCode = Int(code.value) - 64 
	        output = output * 26 + alphabetCode
        }        
        return output
    }
}
