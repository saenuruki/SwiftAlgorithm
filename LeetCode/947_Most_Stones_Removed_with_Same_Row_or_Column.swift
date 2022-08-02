class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
         
        let stones = stones.map({ (row: $0[0], col: $0[1]) })
        var unionFind = UnionFind(stones: stones)
        for stone in stones {
            let row = -(stone.row + 1)
            let col = stone.col + 1
            unionFind.union(row, col)
        }
        return stones.count - unionFind.count
    }
}

class UnionFind {
    var parent = [Int: Int]()
    var rank = [Int: Int]()
    var count: Int
    
    init(stones: [(row: Int, col: Int)]) {
        for stone in stones {
            let row = -(stone.row + 1)
            let col = stone.col + 1
            parent[row] = row
            parent[col] = col
            rank[row] = 1
            rank[col] = 1
        }
        count = parent.count
    }
    
    func find(_ num: Int) -> Int {
        if parent[num] != num {
            parent[num] = find(parent[num, default: 0])
        }
        return parent[num] ?? 0
    }
    
    func union(_ x: Int, _ y: Int) {
        let xParent = find(x)
        let yParent = find(y)
        if xParent == yParent { return }
        count -= 1
        
        if let xRank = rank[xParent], let yRank = rank[yParent], xRank < yRank { 
            parent[xParent] = yParent
        } else if let xRank = rank[xParent], let yRank = rank[yParent], xRank > yRank {
            parent[yParent] = xParent
        } else {
            parent[yParent] = xParent
            rank[xParent] = rank[yParent, default: 0] + 1
        }
    }
}
