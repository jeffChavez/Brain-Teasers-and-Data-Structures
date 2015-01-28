// Playground - noun: a place where people can play

/*

Imagine a (literal) stack of plates If the stack gets too high, it might topple There- fore, in real life, we would likely start a new stack when the previous stack exceeds some threshold. Implement a data structure SetOfStacks that mimics this. SetOfStacks should be composed of several stacks, and should create a new stack once the previous one exceeds capacity. SetOfStacks push() and SetOfStacks pop() should behave identically to a single stack (that is, pop() should return the same values as it would if there were just a single stack)

*/

class SetOfStacks {
    
    var arrayOfStacks = [Stack]()
    var capacity : Int!
    
    
    init (capacity : Int) {
        self.capacity = capacity
    }
    
    func pushToSet (value: Int) {
        if self.arrayOfStacks.isEmpty {
            var stack = Stack()
            stack.push(value)
            arrayOfStacks.append(stack)
        } else {
            var index = self.arrayOfStacks.count - 1
            var currentStack = self.arrayOfStacks[index]
            if currentStack.stackArray.count < self.capacity {
                currentStack.push(value)
                return
            }
            var stack = Stack()
            stack.push(value)
            arrayOfStacks.append(stack)
        }
    }
    
    func popFromSet () -> Int? {
        if !arrayOfStacks.isEmpty {
            var index = arrayOfStacks.count - 1
            var currentStack = arrayOfStacks[index]
            if currentStack.peek() != nil {
                return currentStack.pop()
            }
            arrayOfStacks.removeAtIndex(index)
            if !arrayOfStacks.isEmpty {
                var currentStack = arrayOfStacks[index - 1]
                if currentStack.peek() != nil {
                    return currentStack.pop()
                }
                return nil
            }
            return nil
        }
        return nil
    }
    
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
            return stackArray.last
        }
    }
}

var manyStacks = SetOfStacks(capacity: 2)
manyStacks.pushToSet(1)
manyStacks.pushToSet(1)
manyStacks.pushToSet(1)
manyStacks.pushToSet(1)
manyStacks.popFromSet()
manyStacks.popFromSet()
manyStacks.popFromSet()
manyStacks.popFromSet()
manyStacks.pushToSet(1)
manyStacks.pushToSet(1)
manyStacks.pushToSet(1)
manyStacks.pushToSet(1)
manyStacks.popFromSet()
manyStacks.popFromSet()
manyStacks.popFromSet()
manyStacks.popFromSet()
manyStacks.popFromSet()

