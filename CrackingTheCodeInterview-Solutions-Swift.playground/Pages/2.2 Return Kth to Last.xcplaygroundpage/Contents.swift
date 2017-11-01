//: [Previous](@previous)
//:## 2.2 Return Kth to Last
//: ### Implement an algorith to find the kth to last element of a singly linked list.

func kthFromLast<Type>(list: LinkedList<Type>, kth: UInt) -> Node<Type>? {
    guard !list.isEmpty else { return nil }
    
    //1st: count
    let count = countElementsIn(list:list) //O(n)
    
    //2nd: check count >= kth
    guard count >= kth else { return nil }
    
    //3rd: traverse from head to kth
    var current = list.head
    var index = count
    while index > kth && current?.next != nil {
        current = current?.next
        index -= 1
    }
    return current
}

// MARK: - Helper functions -
func countElementsIn<T>(list: LinkedList<T>) -> UInt {
    guard !list.isEmpty else { return 0 }
    
    var current = list.head
    var count:UInt = 0
    while current != nil {
        count += 1
        current = current?.next
    }
    
    return count
}

let list = LinkedList<String>()

list.append("1st")
list.append("2nd")
list.append("3rd")
list.append("4th")
list.append("5th")
list.append("6th")

print(list.description)
let kthElement = kthFromLast(list: list, kth: 0)
print("kth: \(kthElement?.value ?? "nil")")

//: [Next](@next)
