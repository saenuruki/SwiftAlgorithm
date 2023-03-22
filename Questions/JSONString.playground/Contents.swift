import UIKit

func convertJSONStringToDictionary(jsonString: String) -> [String: Any]? {
    guard let jsonData = jsonString.data(using: .utf8) else { return nil }
    guard let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) else { return nil }
    guard let dictionary = jsonObject as? [String: Any] else { return nil }
    return dictionary
}

func convertJSONStringToDictionary2(jsonString: String) -> [String: Any]? {
    
    let jsonChars = Array(jsonString)
    var pointer = 0
    var currentKey = ""
    var currentValue = ""
    var isValue = false
    var result = [String: Any]()
    while pointer < jsonChars.count {
        if jsonChars[pointer] == "[" {
            var subArray = [String]()
            var subString = ""
            pointer += 1
            while pointer < jsonChars.count {
                if jsonChars[pointer] == "]" { break }
                if jsonChars[pointer] == "," {
                    subArray.append(subString)
                    subString = ""
                } else {
                    subString += String(jsonChars[pointer])
                }
                pointer += 1
            }
            result[currentKey] = subArray.compactMap({ convertJSONStringToDictionary2(jsonString: $0) })
            currentKey = ""
            isValue = false
        } else if jsonChars[pointer] == "{" {
            var subString = ""
            pointer += 1
            while pointer < jsonChars.count {
                if jsonChars[pointer] == "}" { break }
                subString += String(jsonChars[pointer])
                pointer += 1
            }
            result[currentKey] = convertJSONStringToDictionary2(jsonString: subString)
            currentKey = ""
            isValue = false
        } else if jsonChars[pointer] == ":" {
            isValue = true
        } else if jsonChars[pointer] == "," {
            if let num = Int(currentValue) {
                result[currentKey] = num
            } else if let bool = Bool(currentValue) {
                result[currentKey] = bool
            } else {
                result[currentKey] = currentValue
            }
            isValue = false
            currentKey = ""
            currentValue = ""
        } else if isValue {
            currentValue += String(jsonChars[pointer])
        } else {
            currentKey += String(jsonChars[pointer])
        }
        pointer += 1
    }
    return result
}


let jsonString = "{\"a\": [{\"b\": \"hello\", \"c\": 21, \"d\": true}, {\"b\": \"Morning\", \"c\": 54, \"d\": false}], \"e\": \"2020-10-20\"}"
print(convertJSONStringToDictionary2(jsonString: jsonString))
