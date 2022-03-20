let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> String {
    // Input
    let targetLetter = Array(readLine()!)
    let inputtedLetter = Array(readLine()!)

    var targetPointer = 0
    var output = 0
    for i in 0..<inputtedLetter.count {
        guard targetLetter.count > targetPointer else { 
            let remainLetter = inputtedLetter.count - i
            return "\(remainLetter + output)"
        }
        if inputtedLetter[i] == targetLetter[targetPointer] {
            targetPointer += 1
        } else {
            output += 1
        }
    }
    
    if targetPointer == targetLetter.count {
        return "\(output)"
    } else {
        return "IMPOSSIBLE"
    }
}
