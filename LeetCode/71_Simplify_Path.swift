class Solution {
    func simplifyPath(_ path: String) -> String {    
        let pathComponents = path.split(separator: "/")
        var simplifyComponents = [String]()
        for component in pathComponents {
            if component == "" { continue }
            if component == "." { continue }
            if component == ".." && simplifyComponents.count > 0 { simplifyComponents.removeLast(); continue }
            if component == ".." { continue }
            simplifyComponents.append(String(component))
        }
        
        let output = simplifyComponents.reduce("") { result, str in result + "/" + str }
        guard output != "" else { return "/" }
        return output
    }
}
