class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        var index = 0
        var stage = 0
        while true {
            guard index < matrix.first!.count && index >= 0 else { break }
            guard stage < matrix.count && stage >= 0 else { break }
            let row = matrix[stage]
            if row[index] == target { 
                return true 
            } else if row[index] > target {
                if index == 0 { break }
                index -= 1
                if stage == 0 { stage += 1 }
            } else {
                if stage == 0 && index != row.count - 1 {
                    index += 1
                } else {
                    stage += 1
                }
            }
        }
        return false
    }
}


// １行目を右方向に探索する
// 1行目でtargetより大きかったら一旦ストップ
// 一段下に行く
// 自信がtargetより大きかったら左に行く（targetと等しい場合は終了、targetより小さくなるまで続ける）
// 止まったら一段下に行く
// 段のindex0になるまで繰り返す
// それでも見つからない場合はfalse
