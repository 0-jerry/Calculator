//
//  Calculator.swift
//  Calculator
//
//  Created by t2023-m0072 on 10/28/24.
//

import Foundation

struct Calculator {
    
    func calculate(_ operator: Self.Operator, firstNumber: Double, secondNumber: Double ) -> Double {
        switch `operator`{
        case .add:
            return AddOperation().calculate(firstNumber, secondNumber)
            
        case .substract:
            return SubstractOperation().calculate(firstNumber, secondNumber)
            
        case .multiply:
            return MultiplyOperation().calculate(firstNumber, secondNumber)

        case .divide:
            return DivideOperation().calculate(firstNumber, secondNumber)
        }
    }
    
    
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
