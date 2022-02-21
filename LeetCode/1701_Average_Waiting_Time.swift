// time: O(N)
// space: O(2)
class Solution {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
        guard customers.count > 0 else { return 0.0 }
        
        var output = 0
        var pointer = 0
        for customer in customers {
            let arrival = customer[0]
            let time = customer[1]
            if pointer > arrival {
                output += time + (pointer - arrival)
                pointer = time + pointer
            } else {
                output += time
                pointer = time + arrival
            }
        }
        
        return Double(output) / Double(customers.count)
    }
}

