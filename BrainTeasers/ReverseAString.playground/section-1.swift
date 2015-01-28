// Playground - noun: a place where people can play

//Reverse a string

var rev : String = ""

for character in "Hello" {
    
    rev = "\(character)"+"\(rev)"
    
    println(rev)
}

func fibonacci (numberOfTimes: Int) -> Int? {
    var fibo = 1
    for number in 1...numberOfTimes {
        var num = fibo
        var sum = fibo + num
    }
    return fibo
}

fibonacci(10)