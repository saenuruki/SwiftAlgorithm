let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> String {
    
    // input
    let str = readLine()!
    
    guard !str.isEmpty else { return "" }
    let firstChar = str.first!
    guard str.filter({ $0.ascii == firstChar.ascii}).count != str.count else { return str }
    
    var output = ""
    let strArray = Array(str)
    var pointer = 0
    var repeatCount = 1
    while pointer < strArray.count {
        if pointer != 0 {
            if output.last!.ascii == strArray[pointer].ascii {
                repeatCount += 1
            } else {
                if output.last!.ascii < strArray[pointer].ascii {
                    output += String(repeating: output.last!, count: repeatCount)
                }
                repeatCount = 1
            }
        }
        output += String(strArray[pointer])
        pointer += 1
    }
    return output
}

extension Character {
    var ascii: Int {
        return Int(unicodeScalars.first!.value)
    }
}
