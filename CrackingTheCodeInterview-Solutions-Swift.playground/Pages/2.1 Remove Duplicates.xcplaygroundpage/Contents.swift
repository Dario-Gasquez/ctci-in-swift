//: [Previous](@previous)
//:## 2.1 Remove Duplicates
//: ### Write code that removes duplicate nodes from a linked list

func deleteDuplicates(from list: LinkedList<String>) {
    guard !list.isEmpty else { return }
    
    var current = list.head
    var nodeToCheck: Node<String>?
    while current?.next != nil {
        nodeToCheck = current
        while nodeToCheck?.next != nil {
            if nodeToCheck?.next?.value == current?.value { //duplicate found, delete
                nodeToCheck?.next = nodeToCheck?.next?.next
            } else {
                nodeToCheck = nodeToCheck?.next
            }
        }
        current = current?.next
    }
}


let list = LinkedList<String>()

list.append("a")
list.append("a")
list.append("a")
list.append("b")
list.append("c")
list.append("b")
list.append("d")
list.append("c")
list.append("c")
list.append("bc")

print(list.description)
deleteDuplicates(from: list)
print(list.description)

//: [Next](@next)
