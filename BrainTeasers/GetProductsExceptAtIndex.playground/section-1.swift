// Playground - noun: a place where people can play

import UIKit

/*
You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.

For example, given: [1, 7, 3, 4]
your function would return: [84, 12, 28, 21]
by calculating: [7*3*4, 1*3*4, 1*7*4, 1*7*3]
Do not use division in your solution.
*/

var arrayOfInts = [1,2,3,4]

func getProductsOfAllIntsExceptAtIndex (array: [Int]) -> [Int] {
    var arrayOfProducts = [Int]()
    for var index = 0; index < array.count; index++ {
        var newArray = array
        newArray.removeAtIndex(index)
        var product = 1
        for var index = 0; index < newArray.count; index++ {
            product *= newArray[index]
        }
        arrayOfProducts.append(product)
    }
    return arrayOfProducts
}
getProductsOfAllIntsExceptAtIndex(arrayOfInts)
