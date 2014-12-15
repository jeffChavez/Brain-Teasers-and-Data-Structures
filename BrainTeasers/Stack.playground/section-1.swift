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

var stack = Stack()
stack.push(1)
stack.push(2)
stack.push(3)
stack.pop()
stack.peek()