//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Mert Kahraman on 21/07/16.
//  Copyright © 2016 Mert Kahraman. All rights reserved.
//
// N: indicates a note to the developer working on this project at the moment.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorLabel: UILabel!
    
    // Here we initialize our two main entities: 
    // (1) calculator which is a type of Calculator class, computes and handles all the calculating related activities. 
    // (2) display which is a type of Display, regulates and updates the display on the label area on top of our app
    var calculator = Calculator(finalValue: 0, firstValue: 0, secondValue: 0)
    var display = Terminal(outputDisplay: "") // Initial display should be empty
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Any additional setup after loading the view
        
        // Here we set our label area to be empty
        calculatorLabel.text = display.outputDisplay
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // When All Clear is pressed
    @IBAction func allClear() {
        calculator.allClear()
        display.wipeTerminal()
        calculatorLabel.text = ""
    }
    
    // When equals is pressed
    @IBAction func equals() {
        if calculator.operation != .none {
        // Here we simply, check if = is pressed without selecting any operation before and inputting any additional number. If so then nothing happens, otherwise we continue with calculation.
        if display.output != nil { // This statement controls the optionality of current terminal output
            calculator.storeSecondValue(display.output!) // Here we store the second value before calculating
        }
        calculator.calculate() // This statement is for the main calculation
        calculatorLabel.text = String(calculator.calculate()) // Here we update the label on our Terminal area
        display.wipeTerminal() // We wipe the Terminal using wipeTerminal() function and clear the display area
        
        } else {
            // Here we end our .none check of current operation and execute nothing.
        }
    }
    
    
    // When + button is pressed
    @IBAction func sum() {
        calculator.operationSelect(.sum) // We set the operation to be sum
        // N: Update the following to an optional binding
        if display.output != nil { // We check if the terminal are is not nil before continuing
            calculator.storeFirstValue(display.output!)
        }
        
        display.wipeTerminal() // Lastly, we wipe the Terminal using wipeTerminal() function and clear the display area

        calculatorLabel.text = display.outputDisplay
        
    }
    
    @IBAction func subtract() {
        calculator.operationSelect(.subtract)
        if display.output != nil {
            calculator.storeFirstValue(display.output!)
        }
        display.wipeTerminal()
        
        calculatorLabel.text = display.outputDisplay
    }
    
    @IBAction func multiply() {
        calculator.operationSelect(.multiply)
        if display.output != nil {
            calculator.storeFirstValue(display.output!)
        }
        display.wipeTerminal()
        
        calculatorLabel.text = display.outputDisplay
    }
    
    @IBAction func divide() {
        calculator.operationSelect(.divide)
        if display.output != nil {
            calculator.storeFirstValue(display.output!)
        }
        display.wipeTerminal()
        
        calculatorLabel.text = display.outputDisplay
    }
    
    // When number buttons are pressed
    @IBAction func dot() {
        display.appendDot()
        calculatorLabel.text = display.outputDisplay
    }
   
    @IBAction func zero() {
        display.memoryToDisplay(0)
        calculatorLabel.text = display.outputDisplay
    }
    
    @IBAction func one() {
        // display.inputToMemory(1)
        display.memoryToDisplay(1)
        calculatorLabel.text = display.outputDisplay
    }
    
    @IBAction func two() {
        // display.inputToMemory(2)
        display.memoryToDisplay(2)
        calculatorLabel.text = display.outputDisplay
    }
    
    @IBAction func three() {
        display.memoryToDisplay(3)
        calculatorLabel.text = display.outputDisplay
    }
    
    @IBAction func four() {
        display.memoryToDisplay(4)
        calculatorLabel.text = display.outputDisplay
    }
    
    @IBAction func five() {
        display.memoryToDisplay(5)
        calculatorLabel.text = display.outputDisplay}
    
    @IBAction func six() {
        display.memoryToDisplay(6)
        calculatorLabel.text = display.outputDisplay
    }

    @IBAction func seven() {
        display.memoryToDisplay(7)
        calculatorLabel.text = display.outputDisplay
    }

    @IBAction func eight() {
        display.memoryToDisplay(8)
        calculatorLabel.text = display.outputDisplay
    }

    @IBAction func nine() {
        display.memoryToDisplay(9)
        calculatorLabel.text = display.outputDisplay
    }

}


















