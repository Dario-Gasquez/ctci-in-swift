//: [Previous](@previous)
//:## 1.3 URLify
//: ### Write a method to replace all spaces in a string with '%20'. You may assume that the string has sufficient space at the end to hold the additional characters,and that you are given the "true" length of the string. (Note: If implementing in Java,please use a character array so that you can perform this operation in place.)

func urlify(string: String, trueLength: Int) -> String? {
    guard trueLength <= string.count else { return nil }
    
    var urlified = ""
    var index = string.startIndex
    for _ in 0..<trueLength {
        if string[index] == " " {
            urlified.append("%20")
        } else {
            urlified.append(string[index])
        }
        index = string.index(after: index)
    }
    return urlified
}

let urlified = urlify(string: "Mr John Smith   ", trueLength: 13)
print("urlified: \(urlified ?? "NO URLIFIED")")

//: [Next](@next)
