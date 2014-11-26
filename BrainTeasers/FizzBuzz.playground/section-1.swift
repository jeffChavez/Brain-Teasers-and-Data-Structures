// Playground - noun: a place where people can play


//FizzBuzz Problem
for n in 1...20 {
    
    var result = ""
    
    if n % 3 == 0 {result = "Fizz"}
    if n % 5 == 0 {result += "Buzz"}
    if result != "" {println(result)}
    else {println(n)}
}