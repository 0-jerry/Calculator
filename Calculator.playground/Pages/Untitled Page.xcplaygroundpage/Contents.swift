//
//  Calculator.swift
//  Calculator
//
//  Created by t2023-m0072 on 10/28/24.
//

import Foundation

struct Calculator {
    
    // Operator 열거형을 통해 연산자 입력
    static func calculate(_ operator: Self.Operator, firstNumber: Int, secondNumber: Int) {
        
        switch `operator`{
        case .add:
            AddOperation.calculate(firstNumber, secondNumber)
            
        case .substract:
            SubstractOperation.calculate(firstNumber, secondNumber)
            
        case .multiply:
            MultiplyOperation.calculate(firstNumber, secondNumber)

        case .divide:
            DivideOperation.calculate(firstNumber,secondNumber)
        }
    }
    
    
    // 연산자 프로토콜
    // - calculate 메서드 필수 구현
    private protocol AbstractOperation {
        static func calculate(_ firstNumber: Int, _ secondNumber: Int)
    }
    
    // 덧셈 연산자 구조체
    private struct AddOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            return print("\(firstNumber) + \(secondNumber) = \(firstNumber + secondNumber)")
        }
    }
    
    // 뺄셈 연산자 구조체
    private struct SubstractOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            print("\(firstNumber) - \(secondNumber) = \(firstNumber - secondNumber)")
        }
    }
    
    // 곱셈 연산자 구조체
    private struct MultiplyOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            print("\(firstNumber) * \(secondNumber) = \(firstNumber * secondNumber)")
        }
    }
    
    
    // 나눗셈 연산자 구조체
    private struct DivideOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            guard secondNumber != 0 else {
                print("0으로는 나눌 수 없습니다.")
                return
            }
            print("\(firstNumber) / \(secondNumber) = \(firstNumber / secondNumber)∙∙∙\(firstNumber % secondNumber)")
        }
    }

    
    enum Operator {
        case add
        case substract
        case multiply
        case divide
    }
}



Calculator.calculate(.add, firstNumber: 10, secondNumber: 3)
Calculator.calculate(.substract, firstNumber: 10, secondNumber: 3)
Calculator.calculate(.multiply, firstNumber: 10, secondNumber: 3)
Calculator.calculate(.divide, firstNumber: 10, secondNumber: 3)
Calculator.calculate(.divide, firstNumber: 10, secondNumber: 0)
