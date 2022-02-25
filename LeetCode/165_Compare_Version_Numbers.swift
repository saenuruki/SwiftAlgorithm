class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let versionArray1 = version1.split(separator: ".").compactMap({ Int($0) })
        let versionArray2 = version2.split(separator: ".").compactMap({ Int($0) })

        for i in 0..<max(versionArray1.count, versionArray2.count) {
            let revision1 = versionArray1.count > i ? versionArray1[i] : 0
            let revision2 = versionArray2.count > i ? versionArray2[i] : 0
            if revision1 == revision2 {
                continue
            } else if revision1 > revision2 {
                return 1
            } else {
                return -1
            }
        }
        return 0
    }
}
