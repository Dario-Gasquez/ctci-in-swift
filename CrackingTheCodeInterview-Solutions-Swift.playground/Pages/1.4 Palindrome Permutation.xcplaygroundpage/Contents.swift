//: [Previous](@previous)
//:## 1.4 Palindrome Permutation
//: ### Given a string, write a function to check if it is a permutation of a palin­drome. A palindrome is a word or phrase that is the same  forwards and backwards. A permutation is a rearrangement of letters. The palindrome does not need to be limited to just dictionary words.

func isPalindromePermutation(_ string: String) -> Bool {
    //TODO: Do we consider 1char strings, space only strings, empty strings as false?
    guard string.count > 0 else { return false } //Asumption: empy strings are not considered palidrome permutations
    
    var oddsCount = 0
    var charactersCount = [Character: Int]()
    
    //TODO:
    //1: count how many times each characters repeat in string
    //1.b: increase oddsCount when character count is odd and decrease it when the count is even
    for char in string.lowercased() { //Assumption: no special treatment for different case
        guard char != " " else { continue }
        
        if var charCount = charactersCount[char] {
            charCount += 1
            charactersCount[char] = charCount
            if isOdd(charCount) {
                oddsCount += 1
            } else {
                oddsCount -= 1
            }
        } else {
            charactersCount[char] = 1
            oddsCount += 1
        }
    }
    
    //2nd: check if oddsCount is greater than 1 or not and return false or true based on that
    return (oddsCount > 1) ? false : true
}


// MARK: - helpper function -
func isOdd(_ intNumber: Int) -> Bool {
    return (intNumber % 2 == 0) ? false : true
}

let sample = "      "

print("isPalindromePerm: \(sample) : \(isPalindromePermutation(sample))")




//: [Next](@next)
