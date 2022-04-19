import Foundation

class Solution {
    func minAreaRect(_ points: [[Int]]) -> Int {
        
        
        var pointDict = [String: CGPoint]()
        for point in points {
            let key = "\(point[0])-\(point[1])"
            pointDict[key] = CGPoint(x: point[0], y: point[1])
        }
        
        var output: Int = -1
        let pointValues = Array(pointDict.values)
        for i in 0..<pointValues.count - 1 {
            for j in i..<pointValues.count {
                guard pointValues[i].x != pointValues[j].x && pointValues[i].y != pointValues[j].y else { continue }
                guard 
                    pointDict["\(Int(pointValues[i].x))-\(Int(pointValues[j].y))"] != nil && 
                    pointDict["\(Int(pointValues[j].x))-\(Int(pointValues[i].y))"] != nil 
                else { continue }
                let area = Int(abs(pointValues[i].x - pointValues[j].x) * abs(pointValues[i].y - pointValues[j].y))
                output = output == -1 ? area : min(output, area)                
            }
        }
        
        return output == -1 ? 0 : output
    }
}
