class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        
        var output = Array(repeating: Array(repeating: 0, count: n), count: n)
        let iterateCount = n * n
        var rowPointer = 0
        var colPointer = 0
        var currentValue = 1
        var direction = Direction.right
        
        while currentValue <= iterateCount {            
            output[rowPointer][colPointer] = currentValue
            switch direction {
            case .up:
                if rowPointer - 1 >= 0, 
                    output[rowPointer - 1][colPointer] == 0 {
                    rowPointer -= 1
                } else {
                    direction = direction.next()
                    colPointer += 1
                }
            case .down:
                if rowPointer + 1 < n, 
                    output[rowPointer + 1][colPointer] == 0 {
                    rowPointer += 1
                } else {
                    direction = direction.next()
                    colPointer -= 1
                }
            case .left:
                if colPointer - 1 >= 0, 
                    output[rowPointer][colPointer - 1] == 0 {
                    colPointer -= 1
                } else {
                    direction = direction.next()
                    rowPointer -= 1
                }
            case .right:
                if colPointer + 1 < n, 
                    output[rowPointer][colPointer + 1] == 0 {
                    colPointer += 1
                } else {
                    direction = direction.next()
                    rowPointer += 1
                }
            }
            currentValue += 1
        }
         
        return output
    }
}

enum Direction {
    case up, down, `right`, `left`
    
    func next() -> Direction {
        switch self {
        case .up:    return .right
        case .right: return .down
        case .down:  return .left
        case .left:  return .up
        }
    }
}
