// time: O(1)
// space: O(1) (※ O(10 + 2))

let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output.name) is ruled by \(output.ruler).")
}

func getOutput() -> (name: String, ruler: String) {
    // input
    let name = readLine()!
    guard name != "" else { return (name: name, ruler: Ruler.nobody.rawValue) }

    let lastChar = name.last!
    let vowelSet: Set<Character> = ["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"]
    let ySet: Set<Character> = ["Y", "y"]
    
    var ruler: Ruler {
        if vowelSet.contains(lastChar) {
            return .alice
        } else if ySet.contains(lastChar) {
            return .nobody
        } else {
            return .bob
        }
    }
    return (name: name, ruler: ruler.rawValue)
}

enum Ruler: String {
    case alice = "Alice"
    case bob = "Bob"
    case nobody = "nobody"
}
