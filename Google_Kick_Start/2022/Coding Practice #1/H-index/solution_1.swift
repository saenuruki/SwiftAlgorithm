// time: O(2N^2)
// space: O(2N)

let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    let outputText = output.reduce("") { result, num in result + " \(num)" }
    print("Case #\(i):\(outputText)")
}

func getOutput() -> [Int] {
    let paperCount = Int(readLine()!)!
    let scores = readLine()!.split(separator: " ").map { Int($0)! }

    var checkedScores = [Int]()
    var output = [Int]()
    for i in 0..<paperCount {
        checkedScores = insertSorted(with: scores[i], into: checkedScores)
        let hIndex = getHIndex(with: checkedScores)
        output.append(hIndex)
    }
    return output
}

func insertSorted(with num: Int, into sortedArray: [Int]) -> [Int] {
    guard sortedArray.count > 0 else { return [num] }
    var output = sortedArray
    var isInserted = false
    for i in 0..<sortedArray.count {
        if sortedArray[i] <= num {
            output.insert(num, at: i)
            isInserted = true
            break
        }
    }
    if !isInserted { output.append(num) }
    return output
}

func getHIndex(with nums: [Int]) -> Int {
    var hIndex = 0
    for i in 0..<nums.count {
        if nums[i] >= i + 1 {
            hIndex = i + 1
        }
    }
    return hIndex
}
