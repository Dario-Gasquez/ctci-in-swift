//: [Previous](@previous)
//:## 1.5 One Way
//: ### There are three types of edits that can be performed on strings: insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.

func areOneEditAway(s1: String, s2: String) -> Bool {
    let countDiff = abs(s1.count - s2.count)
    guard countDiff == 0 || countDiff == 1 else { return false }
    guard s1 != s2 else { return true }
    
    let shortestString = s1.count > s2.count ? s2 : s1
    let longestString = s1.count > s2.count ? s1 : s2
    
    var shortestIndex = shortestString.startIndex
    var longestIndex = longestString.startIndex
    var oneEditFlag = false
    
    repeat {
        if shortestString[shortestIndex] == longestString[longestIndex] {
            shortestIndex = shortestString.index(after: shortestIndex)
            longestIndex = longestString.index(after: longestIndex)
        } else if oneEditFlag == true {
            return false
        } else {
            oneEditFlag = true
            
            // we need to consider replacement case (string lenghts are the same) and hence move shortestIndex also
            if shortestString.count == longestString.count {
                shortestIndex = shortestString.index(after: shortestIndex)
            }
            longestIndex = longestString.index(after: longestIndex)
        }
        
    } while shortestIndex < shortestString.endIndex && longestIndex < longestString.endIndex
    
    //if we reached the end of the shortest string and there is still one char in the longest one. So if they were equals so far, there is a change, but if there was already a change then we have 2, and hence should return false.
    if longestIndex < longestString.endIndex {
        oneEditFlag = !oneEditFlag
    }
    
    return oneEditFlag
}

let s1 = "ples"
let s2 = "pales"

print("\(s1) and \(s2) are one way appart: \(areOneEditAway(s1: s1, s2: s2))")


//: [Next](@next)
