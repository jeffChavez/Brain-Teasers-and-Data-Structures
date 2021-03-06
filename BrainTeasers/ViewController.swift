//
//  ViewController.swift
//  BrainTeasers
//
//  Created by Jeff Chavez on 11/16/14.
//  Copyright (c) 2014 Jeff Chavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var hashTable = HashTable(size: 10)
        hashTable.setValue("John 689-5950", key: "John")
        hashTable.setValue("Brad 423-4323", key: "Brad")
        hashTable.setValue("Stacy 432-4566", key: "Stacy")
        hashTable.setValue("Bob 123-4325", key: "Bob")
        hashTable.setValue("Tuker 562-3241", key: "Tuker")
        hashTable.setValue("Joe 432-3154", key: "Joe")
        
        hashTable.hash("John")
        hashTable.hash("Brad")
        hashTable.hash("Stacy")
        hashTable.hash("Bob")
        hashTable.hash("Tuker")
        hashTable.hash("Joe")
        hashTable.hash("Sam")
        
        //adding a 7th object, this will trigger the dynamic resizing
        println("The size of the table is \(hashTable.size!)")
        hashTable.setValue("Sam 434-5955", key: "Sam")
        println("The size of the table is \(hashTable.size!)")
    }
}

//
//  HashTable.swift
//  hashTables
//
//  Created by Jeff Chavez on 11/7/14.
//  Copyright (c) 2014 Jeff Chavez. All rights reserved.
//

import Foundation

class HashBucket {
    var next : HashBucket?
    var value : String?
    var key : String?
}

class HashTable {
    
    var size : Int!
    var hashArray = [HashBucket]()
    var filledBuckets : Float = 0
    
    init (size: Int) {
        self.size = size
        for i in 1...size {
            var bucket = HashBucket()
            self.hashArray.append(bucket)
        }
    }
    
    func hash (key: String) -> Int {
        var total = 0
        for character in key.unicodeScalars {
            var asc = Int(character.value)
            total += asc
        }
        return total % self.size!
    }
    
    func setValue (value: String, key: String) {
        var index = self.hash(key)
        var currentBucket: HashBucket? = self.hashArray[index]
        if currentBucket?.key == nil {
            currentBucket?.key = key
            currentBucket?.value = value
        } else {
            while currentBucket?.next != nil {
                currentBucket = currentBucket?.next
            }
            var bucket = HashBucket()
            bucket.key = key
            bucket.value = value
            currentBucket?.next = bucket
        }
        self.filledBuckets++
        
        //dynamic resize
        //if the capacity has reached 70% full
        if Float(self.filledBuckets) >= Float(self.hashArray.count) * 0.7 {
            //create a new array of empty HashBuckets double the size of the hash table
            var newHashArray = [HashBucket]()
            println(self.size)
            for i in 1...self.size * 2 {
                var bucket = HashBucket()
                newHashArray.append(bucket)
            }
            //update size property
            self.size = newHashArray.count
            
            //for each bucket in the smaller array
            for bucket in self.hashArray {
                var currentBucket = bucket
                if currentBucket.key != nil {
                    var newIndex = self.hash(currentBucket.key!)
                    if newHashArray[newIndex].key == nil {
                        newHashArray[newIndex].key = currentBucket.key
                        newHashArray[newIndex].value = currentBucket.value
                    } else {
                        while newHashArray[newIndex].next != nil {
                            newHashArray[newIndex] = newHashArray[newIndex].next!
                        }
                        var newBucket = HashBucket()
                        newBucket.key = currentBucket.key
                        newBucket.value = currentBucket.value
                        newHashArray[newIndex].next = newBucket
                    }
                    
                    while currentBucket.next != nil {
                        if newHashArray[newIndex].key == nil {
                            newHashArray[newIndex].key = currentBucket.key
                            newHashArray[newIndex].value = currentBucket.value
                        } else {
                            while newHashArray[newIndex].next != nil {
                                newHashArray[newIndex] = newHashArray[newIndex].next!
                            }
                            var newBucket = HashBucket()
                            newBucket.key = currentBucket.key
                            newBucket.value = currentBucket.value
                            newHashArray[newIndex].next = newBucket
                        }
                        currentBucket = currentBucket.next!
                    }
                    if newHashArray[newIndex].key == nil {
                        newHashArray[newIndex].key = currentBucket.key
                        newHashArray[newIndex].value = currentBucket.value
                    } else {
                        while newHashArray[newIndex].next != nil {
                            newHashArray[newIndex] = newHashArray[newIndex].next!
                        }
                        var newBucket = HashBucket()
                        newBucket.key = currentBucket.key
                        newBucket.value = currentBucket.value
                        newHashArray[newIndex].next = newBucket
                    }
                }
            }
            //replace the smaller array with the larger one
            self.hashArray = newHashArray
        }
    }
    
    func removeObjectForKey (key : String) {
        var index = self.hash(key)
        var previousBucket : HashBucket?
        var bucket : HashBucket? = self.hashArray[index]
        
        while bucket != nil {
            if bucket!.key == key {
                var nextBucket = bucket?.next
                self.hashArray[index] = bucket!.next!
                bucket = self.hashArray[index].next
            } else {
                previousBucket!.next = bucket?.next
            }
            self.filledBuckets--
            return
        }
    }
}

