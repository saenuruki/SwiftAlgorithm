import Foundation

let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> Int {
    
    // Input
    let input = Int(readLine()!)!
    
    var output = 0 // count
    
    for i in 1...Int(sqrt(Double(input))) {
        if input%i == 0 {
            if isPalindrome(i) { output += 1 }
            if isPalindrome(input/i) && input/i != i { output += 1 }
        }
    }
    
    return output
}


func isPalindrome(_ num: Int) -> Bool {
    let strNum = String(num)
    return strNum == String(strNum.reversed())
}
