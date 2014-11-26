// Playground - noun: a place where people can play

// Create a function that finds the sum of any two multiples below any max value (default is 1000)

func sumOfMultiples (#mult1: Int, #mult2: Int, max:Int = 1000) -> Int {
    
    var sum: Int = 0
    
    for n in 1..<max {
        
        if n % mult1 == 0 || n % mult2 == 0 {sum += n}
    }
    println(sum)
    return sum
}

sumOfMultiples(mult1: 3, mult2: 4, max: 10)
