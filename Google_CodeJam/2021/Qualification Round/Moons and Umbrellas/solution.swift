let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> Int {
    let input = readLine()!.split(separator: " ")
    let x = Int(input[0])!
    let y = Int(input[1])!
    let copyrights: [String] = input[2].map { String($0) }

    if x >= 0 && y >= 0 {
        return findMinimum(x: x, y: y, copyrights: copyrights)
    } else if x < 0 && y < 0 {
        return findMaximum()
    } else if x < 0 && y >= 0 {
        return findLotsOfCJ()
    } else {
        return findLotsOfJC()
    }
}

func findMinimum(x: Int, y: Int, copyrights: [String]) -> Int {
    var lastChar = ""
    var score = 0
    for char in copyrights {
        if char == "?" { continue }
        if char == lastChar { continue }
        if char == "C" && lastChar == "J" {
            score += y
        }
        if char == "J" && lastChar == "C" {
            score += x
        }
        lastChar = char
    }
    return score
}

func findMaximum() -> Int {
    return 0
}

func findLotsOfCJ() -> Int {
    return 0
}

func findLotsOfJC() -> Int {
    return 0
}
