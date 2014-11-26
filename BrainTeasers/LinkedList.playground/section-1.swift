




//create a node class with a value and next parameter
class Node {
    var value : Int?
    var next : Node?
}

//create a linked list with one property head, it is a Node
class LinkedList {
    var head : Node?
    
    //create a method that takes a parameter of type Int
    func insert (value: Int) {
        // 0th case if list is empty
        if self.head == nil {
            var node = Node()
            node.value = value
            node.next = nil
            self.head = node
        } else {
            // Otherwise, walk the list, starting at head
            var currentNode = self.head
            //walk the list until you arrive at an empty .next
            while currentNode?.next != nil {
                currentNode = currentNode?.next
            }
            //once you get there, create an empty node
            var node = Node()
            //set it's value to the one in the parameter
            node.value = value
            //set your current
            currentNode?.next = node
        }
    }
    func remove (value: Int) {
        if self.head != nil {
            if self.head?.value == value {
                self.head = self.head?.next
            }
            var currentNode = self.head
            var previousNode = Node()
            while currentNode?.value != value && currentNode?.next != nil {
                previousNode = currentNode!
                currentNode = currentNode?.next
            }
            if currentNode?.value == value {
                previousNode.next = currentNode?.next
            }
        }
    }
    func displayAsArray () -> [Int] {
        var linkedListValues = [Int]()
        var currentNode = head
        while currentNode != nil {
            linkedListValues.append(currentNode!.value!)
            currentNode = currentNode?.next
        }
    return linkedListValues
    }
}

var linkedList = LinkedList()
linkedList.insert(1)
linkedList.insert(2)
linkedList.insert(3)
linkedList.remove(2)
linkedList.insert(4)
linkedList.remove(1)
linkedList.displayAsArray()


