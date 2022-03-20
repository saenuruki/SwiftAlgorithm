let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> String {
    // Input 
    var givenNum = readLine()!
    var givenNumArray = Array(givenNum).map({ String($0) })
    
    // if the sum of all digits is equal to 9, it's possible to devided by 9
    let sumDigits = givenNumArray.map({ Int(String($0))! }).reduce(0, +)
    let remainNum = sumDigits % 9 == 0 ? 0 : 9 - (sumDigits % 9)
    
    // We need to care if the leading digit is 0
    guard givenNumArray.first != "0" else { 
        let leadingNum = sumDigits % 9 == 0 ? "9" : "\(9 - (sumDigits % 9))"
        return leadingNum + givenNum
    }

    // Find which index we can insert new number
    for i in 0..<givenNumArray.count {
        if i == 0 && remainNum == 0 {
            if givenNumArray.count == 1 { return "90" }
            continue
        } else if Int(givenNumArray[i])! > remainNum {
            givenNumArray.insert(String(remainNum), at: i)
            break
        } else if i == givenNumArray.count - 1 {
            givenNumArray.append(String(remainNum))
        }
    }

    // Make output number from the string
    return givenNumArray.reduce("") { result, str in result + str }
}
