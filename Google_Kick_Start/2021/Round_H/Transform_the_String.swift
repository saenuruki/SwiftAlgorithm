let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> Int {
    // Input
    let sChars = Array(readLine()!).map { $0.ascii }
    let fChars = Array(readLine()!).map { $0.ascii }

    var output = 0
    for sCharNum in sChars {
        var minDiffNum = 13 // actual maxValue
        for fCharNum in fChars {
            var diffNum = abs(sCharNum - fCharNum)
            diffNum = min(diffNum,26 - diffNum)
            minDiffNum = min(minDiffNum, diffNum)
        }
        output += minDiffNum
    }
    return output
}

extension Character {
    var ascii: Int {
        return Int(unicodeScalars.first!.value)
    }
}
