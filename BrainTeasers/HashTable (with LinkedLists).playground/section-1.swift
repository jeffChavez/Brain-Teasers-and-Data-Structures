// Playground - noun: a place where people can play

//a better way to do hashtables by using LinkedLists

class LinkedList {
    
    class Node {
        var value : String?
        var next : Node?
    }
    
    var head : Node?
    
    func setValue (value: String) {
        var node = Node()
        node.value = value
        
        if self.head == nil {
            self.head = node
        } else {
            var currentNode = self.head
            while currentNode?.next != nil {
                currentNode = currentNode?.next
            }
            currentNode?.next = node
        }
    }
    
    func removeValue (value: String) -> String? {
        if self.head == nil {
            return nil
        }
        if self.head?.value == value {
            var value = self.head?.value
            self.head = self.head?.next
            return value
        }
        var currentNode = self.head
        var previousNode : Node!
        while currentNode?.value != value && currentNode?.next != nil {
            previousNode = currentNode!
            currentNode = currentNode?.next
        }
        var nodeToReturn = currentNode
        if currentNode?.value == value {
            previousNode.next = currentNode?.next
            return nodeToReturn?.value
        }
        return nil
    }
}

class HashTable {
    var size : Int!
    var filledLists = 0
    var hashArray = [LinkedList]()
    
    init (size: Int) {
        self.size = size
        for i in 1...self.size {
            self.hashArray.append(LinkedList())
        }
    }
    
    func hash (key: String) -> Int {
        var total = 0
        for character in key.unicodeScalars {
            var asc = Int(character.value)
            total = total + asc
        }
        return total % self.size
    }
    
    func setValue (value: String) {
        self.hashArray[self.hash(value)].setValue(value)
        self.filledLists++
        
        if Float(filledLists) >= Float(self.hashArray.count) * 0.7 {
            var newHashArray = [LinkedList]()
            for i in 1...self.size * 2 {
                newHashArray.append(LinkedList())
            }
            self.size = newHashArray.count
            for list in self.hashArray {
                while list.head != nil {
                    var removedValue = list.removeValue(list.head!.value!)
                    newHashArray[self.hash(removedValue!)].setValue(removedValue!)
                }
            }
            self.hashArray = newHashArray
        }
    }
    
    func removeValue (value: String) {
        self.hashArray[self.hash(value)].removeValue(value)
        self.filledLists--
    }
}

var aHashTable = HashTable(size: 10)
aHashTable.setValue("Brad")
aHashTable.setValue("Brad")
aHashTable.setValue("Bob")
aHashTable.setValue("John")
aHashTable.setValue("Jorge")
aHashTable.setValue("Stacy")
aHashTable.size
aHashTable.setValue("Stacy")
aHashTable.size

aHashTable.hashArray[0].head?.value
aHashTable.hashArray[1].head?.value
aHashTable.hashArray[2].head?.value
aHashTable.hashArray[3].head?.value
aHashTable.hashArray[4].head?.value
aHashTable.hashArray[5].head?.value
aHashTable.hashArray[6].head?.value
aHashTable.hashArray[7].head?.value
aHashTable.hashArray[8].head?.value
aHashTable.hashArray[9].head?.value
aHashTable.hashArray[10].head?.value
aHashTable.hashArray[11].head?.value
aHashTable.hashArray[12].head?.value
aHashTable.hashArray[13].head?.value
aHashTable.hashArray[14].head?.value
aHashTable.hashArray[15].head?.value
aHashTable.hashArray[16].head?.value
aHashTable.hashArray[17].head?.value
aHashTable.hashArray[18].head?.value
aHashTable.hashArray[19].head?.value





