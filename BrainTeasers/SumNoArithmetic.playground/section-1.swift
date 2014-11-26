// Playground - noun: a place where people can play

//Write a function that adds two numbers You should not use + or any arithmetic operators

func addTwoNumbers (number1: Int, number2: Int) -> Int {
    var arrayToCount = [Int]()
    for number in 0...number1 - 1 {
        arrayToCount.append(1)
    }
    for number in 0...number2 - 1 {
        arrayToCount.append(1)
    }
    return arrayToCount.count
}
println(addTwoNumbers(54, 53))