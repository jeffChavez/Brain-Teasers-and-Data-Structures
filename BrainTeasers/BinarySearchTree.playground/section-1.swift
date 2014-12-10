// Playground - noun: a place where people can play

import UIKit

class Tree {
    var value : Int?
    var leftTree : Tree?
    var rightTree : Tree?
    
    init (value: Int) {
        self.value = value
    }
    
    func setValue (value: Int) {
        //check if the value already exists
        if value == self.value {
            //it does, return
            return
        } else {
        //it doesn't exist
            //check if the value is less than the current tree's value
            if value < self.value {
                //check if the left tree is nil
                if self.leftTree == nil {
                    //it is, assign
                    self.leftTree = Tree (value: value)
                } else {
                    //it's not, call setValue on the current tree, back to start
                    self.leftTree?.setValue(value)
                }
            } else {
                //it's not, return
                return
            }
            //check if the value is greater than the current tree's value
            if value > self.value {
                //it is, go to the right tree
                //check if right tree is nil
                if self.rightTree == nil {
                    //it is assign
                    self.rightTree = Tree (value: value)
                } else {
                    //it's not, call setValue on the current tree, back to start
                    self.rightTree?.setValue(value)
                }
            }
        }
    }
    
    func removeValue (value: Int) {
        
    }
}

var tree = Tree(value: 5)
tree.setValue(3)
tree.setValue(6)
tree.setValue(7)
tree.rightTree?.value