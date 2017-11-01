
//:## 1.1 Is Unique
//:### Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
let sample = "abcdAf"

func isUnique(_ s1: String) -> Bool {
    
    var helpDict = [Character: Int]()
    
    for char in s1 {
        let value = helpDict[char] ?? 0
        if value == 0 {
            helpDict[char] = 1
        } else if value >= 1 {
           return false
        }
    }
    return true
}

var flag = true
flag = !flag

print("is \(sample) unique: \(isUnique(sample))")
//: [Next](@next)
