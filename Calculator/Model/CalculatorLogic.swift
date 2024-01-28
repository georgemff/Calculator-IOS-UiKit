//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Gadeishvili on 24.01.24.
//  Copyright © 2024 Georgia, Home Sweet Home. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number_1: Double?
    private var number_2: Double?
    private var symbol: String?
    
    mutating func setNumber(_ number: Double) {
        if self.number_1 == nil {
            self.number_1 = number
        } else {
            self.number_2 = number
        }
       
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number_1 {
            switch symbol {
                
                case "+/-":
//                    self.clear()
                    self.symbol = nil
                    self.number_2 = nil
                    self.number_1 = n * -1
                    return self.number_1
                case "AC":
                    self.clear()
                    return 0
                case "%":
                    self.clear()
                    self.number_1 = n / 100
                    return self.number_1
                case "=":
                    let result = performTwoNumberCalculation()
                    self.number_1 = nil
                    self.number_2 = nil
                    return result
                default:
                if self.symbol == nil { self.symbol = symbol }
                    let result = performTwoNumberCalculation()
                    if let r = result {
                        self.symbol = nil
                        self.number_1 = r
                        self.number_2 = nil
                    }
                    self.symbol = symbol
                    return result
            }
        }
        return nil
        
    }
    
    private func performTwoNumberCalculation() -> Double? {

        if let n1 = number_1, let n2 = number_2, let operation = symbol {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases!")
            }
        }
        
        return nil
    }
    
    private mutating func clear() -> Void {
        self.symbol = nil
        self.number_1 = nil
        self.number_2 = nil
    }
}
