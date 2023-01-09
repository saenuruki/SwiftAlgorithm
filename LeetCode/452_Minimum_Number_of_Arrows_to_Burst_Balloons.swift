class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {

        // 1. Convert ClosedRange and sort it
        let balloons: [ClosedRange] = points.map({ $0.first!...$0.last! })
            .sorted {
                if $0.lowerBound == $1.lowerBound {
                    return $0.upperBound < $1.upperBound 
                } else {
                    return $0.lowerBound < $1.lowerBound
                }
            }

        // 2. Compress the balloons with overlapped
        let isolatedBalloons = balloons.reduce([], { result, balloon in 
            guard !result.isEmpty else { return [balloon] }
            guard let lastRange = result.last! as? ClosedRange<Int> else { return result }
            if lastRange.overlaps(balloon) {
                var newResult = result
                guard let lastBalloon = newResult.removeLast() as? ClosedRange<Int> else { return result }
                return newResult + [lastBalloon.clamped(to: balloon)]
            } else {
                return result + [balloon]
            }
        })
        return isolatedBalloons.count
    }
}
