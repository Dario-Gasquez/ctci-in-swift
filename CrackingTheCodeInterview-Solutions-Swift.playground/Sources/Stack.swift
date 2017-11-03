struct Stack<T> where T: CustomStringConvertible, T: Equatable {
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    mutating func push(_ value: T) {
        stack.append(value)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
    
    
    //MARK: - PRIVATE SECTION -
    private var stack = Array<T>()
}

extension Stack: CustomStringConvertible {
    public var description: String {
        var desc = "["
        
        for element in stack {
            desc += "\(element)"
            if element != stack.last { desc += "|" }
        }
        desc += "<- top"
        return desc
    }
}
