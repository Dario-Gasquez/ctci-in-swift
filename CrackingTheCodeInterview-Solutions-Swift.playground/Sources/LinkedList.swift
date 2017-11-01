
public class Node<Type> {
    init(value: Type) {
        self.value = value
    }
    
    //MARK: - PRIVATE SECTION -
    public var value: Type
    public var next: Node?
}


public class LinkedList<Type> {
    //MARK: - PUBLIC SECTION -
    public var head: Node<Type>?
    
    public var isEmpty: Bool {
        return head == nil
    }

    
    public init() {}
    
    //add a new node with value at the end of the list
    public func append(_ value: Type) {
        let newNode = Node(value: value)
        guard var current = head else {
            head = newNode
            return
        }

        while current.next != nil {
            current = current.next!
        }
        
        current.next = newNode
    }
}


extension LinkedList: CustomStringConvertible {
    public var description: String {
        var current = head
        var description = "linked list: "
        
        while current != nil {
            description += "(\(current!.value))"
            if current!.next != nil {
                description += "->"
            }
            current = current?.next
        }
        return description
    }
}
