//: [Previous](@previous)
//: ## 3.1 Three in Onein
//:### Describe how you could use a single array to implement three stacks.
struct TripleStack<T> {
    
    //MARK: - PUBLIC SECTION -
    
    /// stackSize: the number of elements in each stack
    init(stackSize: Int, initialValue: T) {
        let size = stackSize * self.numberOfStacks
        self.stacksArray = [T](repeating: initialValue, count: size)
        print("stacksArray capacity: \(stacksArray.capacity)")
        self.stackSize = stackSize
        for stack in 1...numberOfStacks {
            let startIndex = (stack - 1) * stackSize - 1 // Index when stacks are empty
            self.stacksTopIndex[stack - 1] = startIndex
        }
        print("stacksTopIndex: \(stacksTopIndex.description)")
    }
    
    
    func isEmpty(stackNumber: Int) -> Bool? {
        guard stackNumber >= 1 && stackNumber <= numberOfStacks else { return nil }
        
        let startIndex = (stackNumber - 1) * stackSize - 1 // Index when stacks are empty
        return stacksTopIndex[stackNumber - 1] == startIndex
        
    }
    
    
    func isFull(stackNumber: Int) -> Bool? {
        guard stackNumber >= 1 && stackNumber <= numberOfStacks else { return nil }
        
        let startIndex = (stackNumber - 1) * stackSize
        let endIndex = startIndex + (stackSize - 1)
        return stacksTopIndex[stackNumber - 1] == endIndex
    }
    
    
    mutating func push(_ element: T, into stackNumber: Int) {
        guard stackNumber >= 1 && stackNumber <= numberOfStacks else { return }
        guard let isFull = isFull(stackNumber: stackNumber), !isFull else {
            print("push attempt in full stack: \(stackNumber). element: \(element)" )
            return
            
        }
        
        stacksTopIndex[stackNumber - 1] += 1
        print("stacksTopIndex: \(stacksTopIndex.description)")
        let topIndex = stacksTopIndex[stackNumber - 1]
        stacksArray[topIndex] = element
    }
    
    
    mutating func pop(from stackNumber: Int) -> T? {
        guard stackNumber >= 1 && stackNumber <= numberOfStacks else { return nil }
        guard let isEmpty = isEmpty(stackNumber: stackNumber), !isEmpty else {
            print("pop attempt in empty stack: \(stackNumber)" )
            return nil
        }
        
        let topIndex = stacksTopIndex[stackNumber - 1]
        let value = stacksArray[topIndex]
        stacksTopIndex[stackNumber - 1] -= 1
        return value
    }
    
    
    //MARK: - PRIVATE SECTION -
    private let numberOfStacks = 3
    private let stackSize: Int // contains the size (maximum amount of elements) each stack can contain
    private var stacksArray:[T]
    // Holds the index of the top element (in stacksArray) for each stack. for example if stacksTopIndex[0] == 5 then stacksArray[5] contains the top element for the first stack.
    private var stacksTopIndex = [Int](repeating: 0, count: 3)
    
}

var tripleStack = TripleStack<String>(stackSize: 2, initialValue: "0")
tripleStack.push("1.1", into: 1)
tripleStack.push("1.2", into: 1)
tripleStack.push("1.3", into: 1)
tripleStack.push("2.1", into: 2)
tripleStack.push("3.1", into: 3)
print("pop from 3: \(tripleStack.pop(from: 3))")
print("pop from 3: \(tripleStack.pop(from: 3))")


//: [Next](@next)

