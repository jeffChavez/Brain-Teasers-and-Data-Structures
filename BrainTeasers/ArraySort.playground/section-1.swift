// Playground - noun: a place where people can play

import UIKit

func sortTwoArrays (array1: [Int], array2: [Int] ) -> [Int] {
    
    var sortedArray = array1
    sortedArray += array2
    var index = 0
    var wasSorted = true
    do {
        wasSorted = true
        for index; index < sortedArray.count; index++ {
            if sortedArray[index] != sortedArray.last && sortedArray[index] > sortedArray[index + 1] {
                wasSorted = false
                var holder = sortedArray[index]
                sortedArray[index] = sortedArray[index + 1]
                sortedArray[index + 1] = holder
            }
        println(sortedArray)
        }
    } while wasSorted == false
    return sortedArray
}
sortTwoArrays([1,2,32], [4,5,6])