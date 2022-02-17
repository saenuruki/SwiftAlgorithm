class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 else { return [candidates] }
        let sortedCandidates = candidates.sorted()
        let output = findCombination(pointer: 0, stack: [], candidates: sortedCandidates, target: target)
        return output.filter { $0 != [] }
    }
    
    func findCombination(pointer: Int, stack: [Int], candidates: [Int], target: Int) -> [[Int]] {
        guard pointer < candidates.count else { return [[]] }
        let sum = stack.reduce(0, +) + candidates[pointer]
        if sum == target { return [stack + [candidates[pointer]]] }
        if sum > target { return [[]] }
        let skipThis = findCombination(pointer: (pointer + 1), stack: stack, candidates: candidates, target: target) 
        let pickThis = findCombination(pointer: pointer, stack: (stack + [candidates[pointer]]),  candidates: candidates, target: target) 
        return skipThis + pickThis
    }
}

