// Playground - noun: a place where people can play

//Reverse a string

var rev : String = ""

for character in "Hello" {
    
    rev = "\(character)"+"\(rev)"
    
    println(rev)
}
