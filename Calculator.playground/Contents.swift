//
//  Calculator.swift
//  Calculator
//
//  Created by t2023-m0072 on 10/28/24.
//

import Foundation

struct Calculator {
    
    private struct AddOperation {
        func calculate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
            return firstNumber + secondNumber
        }
    }
    
    private struct SubstractOperation {
        func calculate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
            return firstNumber - secondNumber
        }
    }
    
    private struct MultiplyOperation {
        func calculate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
            return firstNumber * secondNumber
        }
    }
    
    private struct DivideOperation {
        func calculate(_ firstNumber: Double,_ secondNumber: Double) -> Double {
            return firstNumber / secondNumber
        }
    }
    
    enum Operator {
        case add
        case substract
        case multiply
        case divide
    }
}
