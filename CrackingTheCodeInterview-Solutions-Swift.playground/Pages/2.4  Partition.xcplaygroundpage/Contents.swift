//: [Previous](@previous)
//:## 2.4 Partition
//: ### Write code to partition a linked list aroudna value x, such that all nodes less than x come before all nodes greater than or equal to x. If x is contained within the list, the values of x only need to be after the elements less than x (see below). The partition element x can appear anywhere in the right partition, it does not need to appear between the left and right partitions.

/*
 EXAMPLE:
 Input: 3->5->8->5->10->2->1 [partition = 5]
 Output: 3->1->2->10->5->5->8
 */

func partition(list: LinkedList<Int>, partitionValue: Int) {
    guard !list.isEmpty else { return }
    
    var currentNode = list.head?.next
    var previousNode = list.head
    
    while currentNode != nil {
        if currentNode!.value < partitionValue {
            let nextNode = currentNode?.next
            previousNode?.next = nextNode
            currentNode?.next = list.head
            list.head = currentNode
            currentNode = nextNode
        } else {
            //move forward
            previousNode = currentNode
            currentNode = currentNode?.next
        }
    }
}


let sampleList = LinkedList<Int>()

sampleList.append(3)
sampleList.append(5)
sampleList.append(8)
sampleList.append(5)
sampleList.append(10)
sampleList.append(2)
sampleList.append(1)

partition(list: sampleList, partitionValue: 4)
sampleList.description


//: [Next](@next)
