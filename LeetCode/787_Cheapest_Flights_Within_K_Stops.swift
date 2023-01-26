class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        // 1. making a graph
        var graph = [Int: [(to: Int, price: Int)]]() 
        for flight in flights {
            graph[flight[0], default: []].append((to: flight[1], price: flight[2]))
        }

        // 2. DFS (Back tracking)
        func dfs(source: Int, cost: Int, step: Int, visited: Set<Int>) -> Int {
            var cheapestFlights = Int.max
            guard let nextPlaces = graph[source] else { return cheapestFlights }
            if let targetPlace = nextPlaces.filter({ $0.to == dst }).first {
                cheapestFlights = min(cheapestFlights, cost + targetPlace.price)
            }
            guard step < k else { return cheapestFlights } // possible to access more steps

            var newVisited = visited
            newVisited.insert(source)
            for place in nextPlaces 
                where !newVisited.contains(place.to) && 
                cost + place.price < cheapestFlights {
                let flightPrice = dfs(source: place.to, cost: cost + place.price, step: step + 1, visited: newVisited)
                cheapestFlights = min(cheapestFlights, flightPrice)
            }
            return cheapestFlights
        }
 
        let cheapestFlights = dfs(source: src, cost: 0, step: 0, visited: [])
        return cheapestFlights == Int.max ? -1 : cheapestFlights
    }
}
