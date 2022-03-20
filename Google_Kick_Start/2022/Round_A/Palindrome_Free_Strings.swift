// Dynamic Programing
// key: pattern e.g. 100010
// value: isPossible or not (if there is at least one pattern it's possible)
var memo = [String: Bool]()

let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> String {
    let _ = Int(readLine()!)!
    let givenStrings = readLine()!
    
    // generate all patterns
    let candidates = generateAllCandidates(with: givenStrings)

    // check free palindromes
    var isPossible: Bool {
        for candidate in candidates {
            let isPossible = checkFreePalindromes(with: candidate) 
            if isPossible { return true }
        }
        return false
    }

    return isPossible ? "POSSIBLE" : "IMPOSSIBLE"
}

func generateAllCandidates(with str: String) -> [String] {
    var candidates = [String]()
    for char in str {
        if char == "?" {
            if candidates.count == 0 {
                candidates = ["0", "1"]
            } else {
                let addOne = candidates.map { $0 + "1" }
                let addZero = candidates.map { $0 + "0" }  
                candidates = addOne + addZero
            }
        } else {
            if candidates.count == 0 {
                candidates = [String(char)]
            } else {
                candidates = candidates.map { $0 + String(char) }
            }
        }
    }
    return candidates
}

func checkFreePalindromes(with str: String) -> Bool {
    if let alreadyChecked = memo[str] { return alreadyChecked }
    if str == String(str.reversed()) { memo[str] = false; return false }
    if str.count <= 5 { memo[str] = true; return true }
    
    let dropFirst = String(str.dropFirst())
    let dropLast = String(str.dropLast())
    let dropFirstIsPossible = checkFreePalindromes(with: dropFirst)
    let dropLastIsPossible = checkFreePalindromes(with: dropLast)
    memo[str] = dropFirstIsPossible && dropLastIsPossible
    return dropFirstIsPossible && dropLastIsPossible
}
