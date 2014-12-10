



//Using a stack, write a method that can determine if a string is a palindrome




class Stack {
    
    var stackArray = [Character]()
    
    func push (string: Character) {
        stackArray.append(string)
    }
    
    func pop () -> Character? {
        if !stackArray.isEmpty {
            var charToPop = stackArray.last
            stackArray.removeLast()
            return charToPop!
        }
        return nil
    }
}

func isPalindrome (string: String) -> Bool {
    
    var stack = Stack()
    
    for character in string {
        stack.push(character)
    }
    for character in string {
        if stack.pop() != character {
            return false
        }
    }
    return true
}

var string = "hannah"
isPalindrome(string)
