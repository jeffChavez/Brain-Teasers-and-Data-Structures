// Playground - noun: a place where people can play



class Stack {
    var stackArray = [Int]()
    
    func push (value: Int) {
        stackArray.append(value)
    }
    
    func pop () -> Int? {
        if !stackArray.isEmpty {
            return stackArray.removeLast()
        }
        return nil
    }
    
    func peek () -> Int? {
        if !stackArray.isEmpty {
            return stackArray.last
        }
        return nil
    }
}


func sortAscending (stackOfInts: Stack) -> Stack {
    var stack = stackOfInts
    var newStack = Stack()
    var flag = false
    var container : Int?
    
    while flag == false {
        while stack.peek() <= newStack.peek() || newStack.peek() == nil {
            newStack.push(stack.pop()!)
            println(newStack.stackArray)
            println(stack.stackArray)
        }
        if stack.peek() == nil {
            flag = true
        }
        if container != nil {
            newStack.push(container!)
        }
        container = stack.pop()
        println(container)
        while newStack.peek() <= container || newStack.peek() != nil {
            stack.push(newStack.pop()!)
        }
        newStack.push(container!)
        println(newStack.stackArray)
    }
    return newStack
}

var stackOfInts = Stack()
stackOfInts.push(9)
stackOfInts.push(1)
stackOfInts.push(4)
stackOfInts.push(7)

sortAscending(stackOfInts)
