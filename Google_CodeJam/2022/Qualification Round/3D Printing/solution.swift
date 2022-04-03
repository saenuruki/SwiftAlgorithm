import Foundation
let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> String {
    let firstInput = readLine()!.split(separator: " ").map { Int($0)! }
    let secondInput = readLine()!.split(separator: " ").map { Int($0)! }
    let thirdInput = readLine()!.split(separator: " ").map { Int($0)! }

    let firstPrinter = Printer(cyan: firstInput[0], magenta: firstInput[1], yellow: firstInput[2], black: firstInput[3])
    let secondPrinter = Printer(cyan: secondInput[0], magenta: secondInput[1], yellow: secondInput[2], black: secondInput[3])
    let thirdPrinter = Printer(cyan: thirdInput[0], magenta: thirdInput[1], yellow: thirdInput[2], black: thirdInput[3])

    let minCyan = min(min(firstPrinter.cyan, secondPrinter.cyan), thirdPrinter.cyan)
    let minMagenta = min(min(firstPrinter.magenta, secondPrinter.magenta), thirdPrinter.magenta)
    let minYellow = min(min(firstPrinter.yellow, secondPrinter.yellow), thirdPrinter.yellow)
    let minBlack = min(min(firstPrinter.black, secondPrinter.black), thirdPrinter.black)

    let target = Int(pow(10.0, 6.0))
    let isPossible = minCyan + minMagenta + minYellow + minBlack >= target
    guard isPossible else { return "IMPOSSIBLE" }
    
    var outputPrinter: Printer {
        if minCyan >= target {
            return Printer(cyan: target, magenta: 0, yellow: 0, black: 0)
        } else if minCyan + minMagenta >= target {
            return Printer(cyan: minCyan, magenta: target - minCyan, yellow: 0, black: 0)
        } else if minCyan + minMagenta + minYellow >= target {
            return Printer(cyan: minCyan, magenta: minMagenta, yellow: target - (minCyan + minMagenta), black: 0)
        } else {
            return Printer(cyan: minCyan, magenta: minMagenta, yellow: minYellow, black: target - (minCyan + minMagenta + minYellow))
        }
    }
    return outputPrinter.colors
}

struct Printer {
    let cyan: Int
    let magenta: Int
    let yellow: Int
    let black: Int
    
    var colors: String {
        return "\(self.cyan) \(self.magenta) \(self.yellow) \(self.black)"
    }
}
