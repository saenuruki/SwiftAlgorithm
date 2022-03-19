let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> Int {
    // Input
    let gridCount = Int(readLine()!)!
    let colorGrids = Array(readLine()!).map { Color(rawValue:String($0))!.colorGrid }

    var redCount = 0
    var blueCount = 0
    var yellowCount = 0
    var lastRed = false
    var lastBlue = false
    var lastYellow = false
    for grid in colorGrids {
        if grid.red != lastRed {
            lastRed = grid.red
            if grid.red { redCount += 1 }
        }
        if grid.blue != lastBlue {
            lastBlue = grid.blue
            if grid.blue { blueCount += 1 }
        }
        if grid.yellow != lastYellow {
            lastYellow = grid.yellow
            if grid.yellow { yellowCount += 1 }
        }
    }
    
    return redCount + blueCount + yellowCount
}

struct ColoredGrid {
    let red: Bool
    let blue: Bool
    let yellow: Bool
}

enum Color: String {
    case u = "U"
    case r = "R"
    case y = "Y"
    case b = "B"
    case o = "O"
    case p = "P"
    case g = "G"
    case a = "A"

    var colorGrid: ColoredGrid {
        switch self {
        case .u: return ColoredGrid(red: false, blue: false, yellow: false)
        case .r: return ColoredGrid(red: true, blue: false, yellow: false)
        case .y: return ColoredGrid(red: false, blue: false, yellow: true)
        case .b: return ColoredGrid(red: false, blue: true, yellow: false)
        case .o: return ColoredGrid(red: true, blue: false, yellow: true)
        case .p: return ColoredGrid(red: true, blue: true, yellow: false)
        case .g: return ColoredGrid(red: false, blue: true, yellow: true)
        case .a: return ColoredGrid(red: true, blue: true, yellow: true)
        }
    }
}
