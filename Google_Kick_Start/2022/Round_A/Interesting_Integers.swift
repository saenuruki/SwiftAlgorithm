let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> Int {
    // Input
    let inputRange = readLine()!.split(separator: " ").map { Int($0) }
    let minNum = inputRange[0]!
    let maxNum = inputRange[1]!
    
    // Initial setup
    var count = 0
    var initSrtNum = String(minNum - 1)
    var additionCache = initSrtNum.reduce(0) { result, char in result + Int(String(char))! }
    let initLastDigit = initSrtNum.removeLast()
    var multipleComponent = initSrtNum.reduce(1) { result, char in result * Int(String(char))! }
    var multipleCache = multipleComponent * Int(String(initLastDigit))!

    // O(N)
    for num in minNum...maxNum {
        var strNum = String(num)
        if strNum.last! == "0" {
            // O(K)
            additionCache = String(num).reduce(0) { result, char in result + Int(String(char))! }
            let lastDigit = strNum.removeLast()
            // O(K)
            multipleComponent = strNum.reduce(1) { result, char in result * Int(String(char))! }
            multipleCache = 0
        } else {
            additionCache += 1
            multipleCache += multipleComponent
        }
        
        if multipleCache%additionCache == 0 {
            count += 1
        }
    }
    return count
}
