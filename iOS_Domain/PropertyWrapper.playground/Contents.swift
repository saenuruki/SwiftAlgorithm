import UIKit

@propertyWrapper
struct Email<Value: StringProtocol> {
    var value: Value?
    init(wrappedValue value: Value?) {
        self.value = value
    }
    var wrappedValue: Value? {
        get {
            return validate(email: value) ? value : nil
        }
        set {
            value = newValue
        }
    }
    
    private func validate(email: Value?) -> Bool {
        guard let email = email else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

struct User {
    @Email var email: String?
}

var user1 = User(email: "valid@test.com")
print(user1.email) // test@test.com
var user2 = User(email: "invalid")
print(user2.email) // nil

@propertyWrapper
struct AnyToBool: Decodable {
    var wrappedValue: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let boolValue = try? container.decode(Bool.self) {
            wrappedValue = boolValue
        } else if let intValue = try? container.decode(Int.self) {
            wrappedValue = intValue != 0
        } else if let stringValue = try? container.decode(String.self) {
            let trueSet: Set = ["t", "T", "true"]
            wrappedValue = trueSet.contains(stringValue)
        } else {
            wrappedValue = false
        }
    }
}

struct Feature: Decodable {
    @AnyToBool var isLiked: Bool
    @AnyToBool var isFollowed: Bool
    @AnyToBool var isBookmark: Bool
    @AnyToBool var isPurchased: Bool
}

let jsonData = """
{
    "isLiked": "t",
    "isFollowed": "true",
    "isBookmark": 1,
    "isPurchased": true
}
""".data(using: .utf8)!
let decodedFeature = try! JSONDecoder().decode(Feature.self, from: jsonData)

print(decodedFeature.isLiked)     // true
print(decodedFeature.isFollowed)  // true
print(decodedFeature.isBookmark)  // true
print(decodedFeature.isPurchased) // true

