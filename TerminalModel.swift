//
//  TerminalModel.swift
//  CalculatorApp
//
//  Created by Mert Kahraman on 22/07/16.
//  Copyright © 2016 Mert Kahraman. All rights reserved.
//

import Foundation

// The Terminal class regulates inputs, updates the label and concatenates double values to string for them to be shown properly
class Terminal {
    
    // Our calculator "should" show up to 12 digits at any time
    
    // This variable is our "displayed" content at any time
    var outputDisplay: String
    
    // This variable is our Integer value at any time
    var output: Double?
    
    // This boolean value controls if the number value we're inputting is after the . part
    var isLeft: Bool
    
    // This variable stores inputs inside in an array
    var memory1: [Int]
    var memory2: [Int]
    var preDotSideDisplay: String // This variable will be used if the . is pressed. It simply stores the the numbers until . has been pressed
    
    // Below is our initializition method
    init(outputDisplay: String) {
        self.outputDisplay = outputDisplay // This will allow us to inherit from previous displays
        self.memory1 = [] // Our initial memory arrays should be empty
        self.memory2 = []
        self.output = nil
        self.isLeft = true
        self.preDotSideDisplay = ""
    }
    
    
    // This function wipes the Terminal area after an operation has been pressed
    func wipeTerminal() {
        outputDisplay = ""
        memory1 = []
        memory2 = []
        output = nil
        isLeft = true
        preDotSideDisplay = ""
    }
    
    // This function firstly appends and fills in the array of memory when inputs are being made. It then updates the display area as a string, through the use of the memory array. It iterates inside the array, concatanates the Double values and outputs them as a String
    func memoryToDisplay(input: Int) { // Note: This section has to be reduced!
        if isLeft == true {
        memory1.append(input)
        var l = memory1.count-1 // l is our counter, starts from right side of the memory array
        var rightHandSide = "\(memory1[l])" // We store the RHS as a variable and update it on each loop. Our RHS value is the rightmost Double value inside the array
    
            l -= 1 // To continue building up, we firstly decrease our counter value to one left
        
        while l > -1 { // We create a while loop that iterates and updates the RHS and eventually lets us obtain our output as a String value.
        rightHandSide = "\(memory1[l])" + rightHandSide
        l -= 1
        }
        
        outputDisplay = rightHandSide
        output = Double(rightHandSide)
        }
        
        // If . has been pressed and now we are on the right side of the dot
        else {
        
            
        memory2.append(input)
        var l = memory2.count-1 // l is our counter, starts from right side of the memory array
        var rightHandSide = "\(memory2[l])" // We store the RHS as a variable and update it on each loop. Our RHS value is the rightmost Double value inside the array
            
        l -= 1 // To continue building up, we firstly decrease our counter value to one left
            
        while l > -1 { // We create a while loop that iterates and updates the RHS and eventually lets us obtain our output as a String value.
            rightHandSide = "\(memory2[l])" + rightHandSide
            l -= 1
        }
            outputDisplay = preDotSideDisplay + rightHandSide
            output = Double("\(preDotSideDisplay)\(rightHandSide)")
            
        }
    }
    
    // This function regulates the switch towards the right side of the . decimal, fraction side. It marks the switch by changing the isLeft variable to be false.
    func appendDot() {
        if isLeft != false { // Here we control if . was already pressed in the latest session, so that it doesn't computes again
        preDotSideDisplay = "\(outputDisplay)."
        outputDisplay = preDotSideDisplay
        isLeft = false
        } // If . has been pressed, nothing happens in this function.
    }
    
}