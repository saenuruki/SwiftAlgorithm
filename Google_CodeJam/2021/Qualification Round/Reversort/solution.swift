let testCases = Int(readLine()!)!
for i in 1...testCases {
    let output = getOutput()
    print("Case #\(i): \(output)")
}

func getOutput() -> Int {
    let count = Int(readLine()!)!
    var nums = readLine()!.split(separator: " ").map { Int(String($0))! }

    var output = 0
    for i in 0..<count - 1 {
        if nums[i] == i + 1 {
            output += getScore(i: i, j: i)
        } else {
            let j = nums.firstIndex(of: i + 1)!
            output += getScore(i: i, j: j)
            nums = updateNums(nums: nums, i: i, j: j)
        }
    }
    return output
}

func updateNums(nums: [Int], i: Int, j: Int) -> [Int] {
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

func getScore(i: Int, j: Int) -> Int {
    return j - i + 1
}
