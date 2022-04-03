let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> Int {
    let diceCount = Int(readLine()!)!
    let dices = readLine()!.split(separator: " ").map { Int($0)! }
    let sortedDices = dices.sorted()
    var pointer = 0
    var output = 0
    
    while pointer < dices.count {
        
        while pointer < dices.count && sortedDices[pointer] < (output + 1) {
            pointer += 1
        }
        guard pointer < dices.count else { break }
        pointer += 1
        output += 1
    }
    
    return output
}

