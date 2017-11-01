//: [Previous](@previous)
//:## 1.6 String Compression
//: ### Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the original string, your method should return the original string. You can assume the string has only uppercase and lowercase letters (a - z).

func compressed(string: String) -> String {
    guard string.count > 0 else { return string }
    
    var result = ""
    
    var currChar: Character
    var prevChar = string[string.startIndex]
    var count = 0
    result.append(prevChar)
    
    for index in string.indices {
        currChar = string[index]
        if currChar == prevChar {
            count += 1
        } else {
            prevChar = currChar
            result.append(String(count))
            result.append(currChar)
            count = 1
        }
    }
    
    result.append(String(count))
    
    return result.count > string.count ? string : result
}

let string = "aabcccccaaa"

compressed(string: string)
//: [Next](@next)
