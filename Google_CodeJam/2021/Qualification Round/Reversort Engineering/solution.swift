let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i):\(output)")
}

func getOutput() -> String {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let size = input[0]
    let score = input[1]
    
    // judge IMPOSSIBLE
    guard score >= size - 1 && (size*(size + 1)/2) > score else { return " IMPOSSIBLE" } 

    var nums = [Int](1...size)
    var startIndex = nums.count - 2
    var changableScore = score - (size - 1)

    while changableScore > 0 && startIndex >= 0 {
        let stillPossibleChange = changableScore > nums.count - (startIndex + 1)
        let i = startIndex
        let j = stillPossibleChange ? nums.count - 1 : startIndex + changableScore 
        nums = updateNums(nums: nums, i: i, j: j)
        startIndex -= 1
        changableScore -= j - i
    }
    return nums.map({ String($0) }).reduce("") { result, char in return result + " " + char }
}

func updateNums(nums: [Int], i: Int, j: Int) -> [Int] {
    guard i != j else { return nums }
    var newNums = [Int]()
    for index in 0..<nums.count {
        if index >= i && index <= j {
            newNums.append(nums[j - index + i])
        } else {
            newNums.append(nums[index])
        }
    }
    return newNums
}

