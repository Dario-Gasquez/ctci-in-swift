//: [Previous](@previous)
//:## 1.2 Check Permutation
//: ### Given two strings, write a method to decide if one is a permutation of the other.
let s1 = "abba"
let s2 = "babA"

func arePermutations(string1: String, string2: String) -> Bool {
    
    guard string1.count == string2.count else { return false }
    
    //TODO: sort and compare
    //1. sort strings and string2
    let s1Sorted = string1.lowercased().sorted()
    let s2Sorted = string2.lowercased().sorted()
    
    //2. compare if sorted string1 is equal to sorted string2
    var result = false
    if s1Sorted == s2Sorted {
        result = true
    }
    
    return result
}


if arePermutations(string1: s1, string2: s2) {
    print("they are perumtation")
} else {
    print("NOT PERMUTATIONS")
}


func arePermutations(_ s1: String, _ s2: String) -> Bool {
    guard s1.count == s2.count else { return false }
    
    var helperDict = [Character: Int]()
    
    helperDict = countCharacters(in: s1)
    
    for auxChar in s2.lowercased() {
        if let value = helperDict[auxChar], value > 0 {
            helperDict[auxChar]! -= 1
        } else {
            return false
        }
    }
    
    return true
    
}


//helper functions
func countCharacters(in string: String) -> [Character: Int] {
    
    var result = [Character: Int]()
    
    for char in s1.lowercased() {
        if result[char] == nil {
            result[char] = 1
        }  else {
            result[char]! += 1
        }
    }
    
    print("result: \(result.description)")
    
    return result
}


if arePermutations(s1, s2) {
    print("they are permutation")
} else {
    print("NOT PERMUTATIONS")
}


//: [Next](@next)
