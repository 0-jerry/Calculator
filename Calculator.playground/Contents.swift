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
    
    
    private protocol AbstractOperation {
        func calculate(_ firstNumber: Int, _ secondNumber: Int) -> Int
    }
    
    
    private struct AddOperation: AbstractOperation {
        func calculate(_ firstNumber: Int,_ secondNumber: Int) -> Int {
            return firstNumber + secondNumber
        }
    }
    
    private struct SubstractOperation: AbstractOperation {
        func calculate(_ firstNumber: Int,_ secondNumber: Int) -> Int {
            return firstNumber - secondNumber
        }
    }
    
    private struct MultiplyOperation: AbstractOperation {
        func calculate(_ firstNumber: Int,_ secondNumber: Int) -> Int {
            return firstNumber * secondNumber
        }
    }
    
    private struct DivideOperation: AbstractOperation {
        func calculate(_ firstNumber: Int,_ secondNumber: Int) -> Int {
            return firstNumber / secondNumber
        }
    }
    
    private struct ReminderOperation: AbstractOperation {
        func calculate(_ firstNumber: Int, _ secondNumber: Int) -> Int {
            firstNumber % secondNumber
        }
    }
    
    enum Operator: String {
        case add = "+"
        case substract = "-"
        case multiply = "*"
        case divide = "/"
    }
}
