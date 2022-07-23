class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        
        var currentChar: Character = chars.first!
        var count = 0
        var newChars = [Character]()
        for char in chars {
            if char != currentChar {
                newChars.append(currentChar)
                if count > 1 {
                    let countChars = Array(String(count))
                    for countChar in countChars {
                        newChars.append(countChar)
                    }
                }
                currentChar = char
                count = 1
            } else {
                count += 1
            }
        }
        newChars.append(currentChar)
        if count > 1 {
            let countChars = Array(String(count))
            for countChar in countChars {
                newChars.append(countChar)
            }
        }
        chars = newChars
        return newChars.count
    }
}
