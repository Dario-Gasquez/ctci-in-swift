//: ## Array based Queue
struct Queue<T> {
    
    //MARK: - PUBLIC SECTION -
    var isEmpty: Bool {
        return queueArray.isEmpty
    }
    
    
    // Could also be named 'insert' or similar
    mutating func enqueue(_ value: T) {
        queueArray.append(value)
    }
    
    
    mutating func dequeue() -> T? {
        guard !queueArray.isEmpty else { return nil }
        
        return queueArray.removeFirst() //this is expensive as it causes all the elements in the array to be moved. O(n)
    }
    
    
    //MARK: - PRIVATE SECTION -
    private var queueArray = [T]()
}


extension Queue: CustomStringConvertible {
    public var description: String {
        var desc = "["
        
        for index in 0..<queueArray.count {
            desc += "\(queueArray[index])"
            
            if index < queueArray.count - 1 { desc += " | " }
        }
        
        desc += "]"
        
        return desc
    }
}
