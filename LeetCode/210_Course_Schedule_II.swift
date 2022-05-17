class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        
        // matrix: indicates the dependencies
        var matrix = [[Int]](repeatElement([Int](repeatElement(0, count: numCourses)), count: numCourses))
        // inDegree: can't start the course if the value is not 0
        var inDegree = [Int](repeatElement(0, count: numCourses))
        var count = 0
        var queue = [Int]()
        
        for i in 0..<prerequisites.count {
            let ready = prerequisites[i][0]
            let pre = prerequisites[i][1]
            if matrix[pre][ready] == 0  {
                inDegree[ready] += 1
            }
            matrix[pre][ready] = 1
        }
        for i in 0..<inDegree.count {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        while count < queue.count {
            let course = queue[count]
            count += 1
            for i in 0..<numCourses {
                if matrix[course][i] != 0 {
                    inDegree[i] -= 1
                    if inDegree[i] == 0 {
                        queue.append(i)
                    }
                }
            }
        }
        
        guard count == numCourses else { return [] }
        return queue

    }
}
