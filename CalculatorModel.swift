//
//  CalculatorModel.swift
//  CalculatorApp
//
//  Created by Mert Kahraman on 21/07/16.
//  Copyright © 2016 Mert Kahraman. All rights reserved.
//

import Foundation

enum Operation {
    case sum
    case subtract
    case multiply
    case divide
    case none // Note: Couldn't figure out how to deal with this being an optional, so added this case
}

// Our class calculator is the main class that regulates everything in this model file.
class Calculator {
    
    // This variable will store the latest pressed operator button's operation (such as + to be sum) and used afterwards
    var operation: Operation
    
    // This value will be displayed on the top label area
    var finalValue: Double
    // Our calculator will always receive two consecutive Double inputs, and make certain computations using them. We name these values as the following:
    var firstValue: Double = 0
    var secondValue: Double
    
    // Initialization of our class
    init(finalValue: Double, firstValue: Double, secondValue: Double) {
        self.finalValue = finalValue
        self.firstValue = firstValue
        self.secondValue = secondValue
        self.operation = .none // Note: Couldn't figure out how to deal with this being an optional, so added this statement
    }
    
    // This method is the AC button on the calculator. It sets the finalValue to 0.
    func allClear() {
        finalValue = 0
        firstValue = 0
        secondValue = 0
        operation = .none
    }
    
    // Below method simply stores the type of operation (as an Operation enum type) on the "operation" variable, so that it can be used in a switch operation on the calculate() method
    func operationSelect(operationSelected: Operation) {
        operation = operationSelected // We might need an unwrapping here
    }
    
    // Below two methods are used on the View Controller to update the latest inputted Double typed values on our Calculator entity
    func storeFirstValue(input1: Double) {
        firstValue = input1
    }
    func storeSecondValue(input2: Double) {
        secondValue = input2
    }
    
    // When the = button is pressed, this function is called. It calls the necessary arithmetic or scientific operation through a switch statement. The input of this switch is previously updated "operation" variable.
    // Note: An unwrapping might be necessary to operation variable
    func calculate() -> Double {
        switch operation {
        case .sum: finalValue = sum(firstValue, b: secondValue)
        case .subtract: finalValue = subtract(firstValue, b: secondValue)
        case .multiply: finalValue = multiply(firstValue, b: secondValue)
        case .divide: finalValue = divide(firstValue, b: secondValue)
        case .none: finalValue = 0
        }
        return finalValue
    }
    
    
    // Below we define the basic arithmetic operators:
    
    // Addition Operator
    func sum(a: Double,b: Double) -> Double {
        return a + b
    }
    
    // Subtraction Operator
    func subtract(a: Double,b: Double) -> Double {
        return a - b
    }
    
    // Multiplication Operator
    func multiply(a: Double,b: Double) -> Double {
        return a * b
    }
    
    // Division Operator
    func divide(a: Double,b: Double) -> Double {
        return a / b
    }
    
}


