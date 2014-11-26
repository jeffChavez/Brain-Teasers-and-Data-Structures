// Playground - noun: a place where people can play





class Queue {
    var queueArray = [Int]()
    
    func enqueue (value: Int) {
        queueArray.append(value)
    }
    
    func dequeue () -> Int? {
        if !queueArray.isEmpty {
            var objectToRemove = queueArray.first
            queueArray.removeAtIndex(0)
            return objectToRemove!
        } else {
            return nil
        }
    }
    
    func observe () {
        queueArray
    }
}

var queue = Queue()
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.dequeue()
queue.observe()