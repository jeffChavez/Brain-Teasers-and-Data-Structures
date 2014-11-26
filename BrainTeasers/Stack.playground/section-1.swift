// Playground - noun: a place where people can play




class Stack {
    var stackArray = [Int]()
    
    func push (value: Int) {
        stackArray.append(value)
    }
    
    func pop () -> Int? {
        if !stackArray.isEmpty {
            var objectToRemove = stackArray.last
            stackArray.removeLast()
            return objectToRemove!
        } else {
            return nil
        }
    }
    
    func observe () {
        stackArray
    }
}

var stack = Stack()
stack.push(1)
stack.push(2)
stack.push(3)
stack.pop()
stack.observe()