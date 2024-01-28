//
//  ViewController.swift
//  Calculator - Tutorial (Improved)
//
//  Created by Gerogemff on 26/01/2024.
//  Copyright © 2014 Georgia, Home Sweet Home. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!

    
    private var isFinishedTypingNumber: Bool = true
    private var symbolPressedLast: Bool = false
    
    private var displayValue: Double {
        get {
            var labelText = displayLabel.text
            if labelText != nil && labelText!.contains(",") {
                labelText = labelText!.replacingOccurrences(of: ",", with: ".")
            }
            guard let number = Double(labelText!) else {
                fatalError("Can not convert display label text to a Double")
            }
            return number
        }
        set {
            if newValue == floor(newValue) {
                displayLabel.text = String(Int(newValue))
            } else {
                displayLabel.text = String(newValue).replacingOccurrences(of: ".", with: ",")
            }
            
        }
    }
    
    private var calculator = CalculatorLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension CalculatorController {
    // When action button is pressed [AC, %, +/-, +, -, *, /, =]
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        if !symbolPressedLast {
            calculator.setNumber(displayValue)
        }
        
        if let calcMethod = sender.currentTitle {
            
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
        
        
        if sender.currentTitle! != "=" {
            symbolPressedLast = true
        }
        
    }

    // When numbers button is pressed [1...9]
    @IBAction func numButtonPressed(_ sender: UIButton) {
        symbolPressedLast = false
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                if numValue == "," {
                    displayLabel.text = "0,"
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTypingNumber = false
            } else {
                if numValue == "," && displayLabel.text!.contains(",") {
                        return
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
                        
        }
    
    }
}
