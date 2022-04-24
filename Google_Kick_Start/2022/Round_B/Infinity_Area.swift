let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> Double {
    
    // Input
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let r = input[0]
    let a = input[1]
    let b = input[2]
    
    var output: Double = 0
    var radius = r
    while radius >= 1 {
        output += makeCircle(radius)
        radius = radius * a
        output += makeCircle(radius)
        radius = radius / b
    }
    
    return output
}

func makeCircle(_ r: Int) -> Double {
    return Double.pi * Double(r * r)
}
