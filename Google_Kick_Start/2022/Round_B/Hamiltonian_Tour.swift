let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> String {
    
    // Input: 
    let firstInput = readLine()!.split(separator: " ").map { Int($0)! }
    let r = firstInput[0]
    let c = firstInput[1]
    var grids = [[String]]()
    for i in 0..<r {
        let line = Array(readLine()!).map { String($0) }
        grids.append(line)
    }

    // check validation
    guard checkValidation(grids) else { return "IMPOSSIBLE" }
    
    // Output: Route Path
    var output = ""
    var dp = [[Int]]()
    var possibleCellCount = 0
    for i in 0..<(r * 2) {
        var line = [Int]()
        for j in 0..<(c * 2) {
            if grids[i / 2][j / 2] == "#" {
                line.append(-1)
            } else {
                line.append(0)
                possibleCellCount += 1
            }
        }
        dp.append(line)
    }
    
    // DFS & DP
    var currentDestination: Destination = .south
    var rPointer = 0
    var cPointer = 0
    // dp[rPointer][cPointer] = 1
    let rDP = dp.count
    let cDP = dp.first!.count
    var stack = [(r: Int, c: Int)]()
    
    func isPossibleAccess(_ destination: Destination, _ r: Int, _ c: Int) -> Bool {
        switch destination {
        case .north:
            guard isInRange(r - 1, c, rDP, cDP) else { return false }
            return dp[r - 1][c] == 0 && isOpenCell(r - 1, c, possibleCellCount, output.count)
        case .west:
            guard isInRange(r, c - 1, rDP, cDP) else { return false }
            return dp[r][c - 1] == 0 && isOpenCell(r - 1, c, possibleCellCount, output.count)
        case .south:
            guard isInRange(r + 1, c, rDP, cDP) else { return false }
            return dp[r + 1][c] == 0 && isOpenCell(r - 1, c, possibleCellCount, output.count)
        case .east:
            guard isInRange(r, c + 1, rDP, cDP) else { return false }
            return dp[r][c + 1] == 0 && isOpenCell(r - 1, c, possibleCellCount, output.count)
        }
    }
    
    func shouldReturn(_ r: Int, _ c: Int) -> Bool {
        var count = 0
        if dp[r][c] == 1 { count += 1 }
        if dp[r + 1][c] == 1 { count += 1 }
        if dp[r][c + 1] == 1 { count += 1 }
        if dp[r + 1][c + 1] == 1 { count += 1 }
        return count >= 3
    }
    
    while true {
        if rPointer == 0 && cPointer == 0 && dp[rPointer][cPointer] == 1 { break }
        if shouldReturn(rPointer, cPointer) {
            
        
        }
        
        if isPossibleAccess(currentDestination.previous(), rPointer, cPointer) {
            currentDestination = currentDestination.previous()
        }
        switch currentDestination {
        case .north:
            if isPossibleAccess(currentDestination, rPointer, cPointer) {
                dp[rPointer - 1][cPointer] = 1
                output += currentDestination.rawValue
                rPointer = rPointer - 1
            } else {
                currentDestination = currentDestination.next()
            }
        case .west:
            if isPossibleAccess(currentDestination, rPointer, cPointer) {
                dp[rPointer][cPointer - 1] = 1
                output += currentDestination.rawValue
                cPointer = cPointer - 1
            } else {
                currentDestination = currentDestination.next()
            }
        case .south:
            if isPossibleAccess(currentDestination, rPointer, cPointer) {
                dp[rPointer + 1][cPointer] = 1
                output += currentDestination.rawValue
                rPointer = rPointer + 1
            } else {
                currentDestination = currentDestination.next()
            }
        case .east:
            if isPossibleAccess(currentDestination, rPointer, cPointer) {
                dp[rPointer][cPointer + 1] = 1
                output += currentDestination.rawValue
                cPointer = cPointer + 1
            } else {
                currentDestination = currentDestination.next()
            }
        }
        
    }

    return output
}

func checkValidation(_ grids: [[String]]) -> Bool {
    let r = grids.count
    let c = grids.first!.count
    guard r > 1 || c > 1 else { return true }

    for i in 0..<r {
        for j in 0..<c {
            guard grids[i][j] == "*" else { continue }
            // top
            var topValid: Bool {
                guard isInRange(i - 1, j, r, c) else { return false }
                return grids[i - 1][j] == "*"
            }
            // left
            var leftValid: Bool {
                guard isInRange(i, j - 1, r, c) else { return false }
                return grids[i][j - 1] == "*"
            }
            // right
            var rightValid: Bool {
                guard isInRange(i, j + 1, r, c) else { return false }
                return grids[i][j + 1] == "*"
            }
            // bottom
            var bottomValid: Bool {
                guard isInRange(i + 1, j, r, c) else { return false }
                return grids[i + 1][j] == "*"
            }
            if !topValid && !leftValid && !rightValid && !bottomValid {
                return false
            }
        }
    }
    
    return true
}

func isInRange(_ i: Int, _ j: Int, _ r: Int, _ c: Int) -> Bool {
    return i >= 0 && i < r && j >= 0 && j < c
}

func isOpenCell(_ r: Int, _ c: Int, _ total: Int, _ current: Int) -> Bool {
    guard (r == 0 && c <= 1) || (r <= 1 && c == 0) else { return true }
    return current <= 3 || (total - current) <= 3
}


enum Destination: String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
    
    func next() -> Destination {
        switch self {
            case .north: return .west
            case .south: return .east
            case .east: return .north
            case .west: return .south
        }
    }

    func previous() -> Destination {
        switch self {
            case .north: return .east
            case .south: return .west
            case .east: return .south
            case .west: return .north
        }
    }
}

