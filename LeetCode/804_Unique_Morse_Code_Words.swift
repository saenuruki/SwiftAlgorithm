class Solution {
    
    let morseDB = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."] 
    let a = Character("a").ascii

    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        
        var transformations = Set<String>()
        for word in words {
            var morse = ""
            for char in word {
                let index = char.ascii - a
                morse += morseDB[index]
            }
            transformations.insert(morse)
        }
        
        return transformations.count
    }
}

extension Character {
    var ascii: Int {
        return Int(unicodeScalars.first!.value)
    }
}
