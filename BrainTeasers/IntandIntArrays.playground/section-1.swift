// Playground - noun: a place where people can play


//method with two parameters, int and int array
//write an algorithm that finds two ints in the array that add up to the int parameter


func findTheInts (integer: Int, integerArray: [Int]) -> [Int]? {
    
    return [Int]()
}

func buildArrayTheHardWay(aSum: Int, fromArray: Array<Int>) -> Array<(Int, Int)> {
    println("\nTHE HARD WAY\n")
    
    var outputArray = Array<(Int, Int)>()
    var runningDict = [Int: Bool]()
    
    for var i = 0; i < fromArray.count; ++i {
        //index is 0
        runningDict.updateValue(true, forKey: fromArray[i])
        //aSum is 1, index is 0, k is 1
        var k : Int = aSum - fromArray[i]
        //if key "1" value is true, append to the array
        if runningDict[k] == true {
            println("Operand one is \(fromArray[i]) and operand two is \(k)")
            outputArray.append(fromArray[i], Int(k))
        }
    }
    return outputArray
}
