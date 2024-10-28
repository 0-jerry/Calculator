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
            
            let firstNumberStr = firstNumber >= 0 ? "\(firstNumber)" : "(\(firstNumber))"
            let secondNumberStr = secondNumber >= 0 ? "\(secondNumber)" : "(\(secondNumber))"
            
            //합이 Int.max를 이하이며, Int.min이상
            guard (firstNumber > 0 && Int.max - firstNumber >= secondNumber) ||
                    (firstNumber < 0 && Int.min - firstNumber <= secondNumber) ||
                    (firstNumber == 0) || (secondNumber == 0) else {
                print("연삼 범위를 초과하였습니다.")
                return
            }
            
            print("\(firstNumberStr) ➕ \(secondNumberStr) 🟰 \(firstNumber + secondNumber)")
        }
    }
    
    // 뺄셈 연산자 구조체
    private struct SubstractOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            
            let firstNumberStr = firstNumber >= 0 ? "\(firstNumber)" : "(\(firstNumber))"
            let secondNumberStr = secondNumber >= 0 ? "\(secondNumber)" : "(\(secondNumber))"
            
            //차가 Int.max 이하이며, Int.min이상
            guard (firstNumber == 0) || (secondNumber == 0) ||
                    (firstNumber > 0 && Int.max - firstNumber <= secondNumber) ||
                    (firstNumber < 0 && firstNumber - Int.min >= secondNumber ) else {
                print("연산 범위를 초과하였습니다.")
                return
            }
            
            print("\(firstNumberStr) ➖ \(secondNumberStr) 🟰 \(firstNumber - secondNumber)")
        }
    }
    
    // 곱셈 연산자 구조체
    private struct MultiplyOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            
            let firstNumberStr = firstNumber >= 0 ? "\(firstNumber)" : "(\(firstNumber))"
            let secondNumberStr = secondNumber >= 0 ? "\(secondNumber)" : "(\(secondNumber))"
            
            guard firstNumber != Int.min else {
                if [0,1].contains(secondNumber) {
                    print("\(firstNumberStr) ✖️ \(secondNumberStr) 🟰 \(firstNumber * secondNumber)")
                } else {
                    print("연산 범위를 초과하였습니다.")
                }
                return
            }
            
            guard secondNumber != Int.min else {
                if [0,1].contains(firstNumber) {
                    print("\(firstNumberStr) ✖️ \(secondNumberStr) 🟰 \(firstNumber * secondNumber)")
                } else {
                    print("연산 범위를 초과하였습니다.")
                }
                return
            }
            
            let firstNumberAbs = abs(firstNumber)
            let secondNumberAbs = abs(secondNumber)
            
            // 두 수의 절대값의 곱이 Int.max 이하 (단, Int의 나누기 연산으로 인해 오차 발생 가능)
            guard [0,1].contains(firstNumberAbs) || [0,1].contains(secondNumberAbs) ||
                    (firstNumberAbs <= Int.max / secondNumberAbs) else {
                print("연산 범위를 초과하였습니다.")
                return
            }
            
            print("\(firstNumber) ✖️ \(secondNumber) 🟰 \(firstNumber * secondNumber)")
        }
    }
    
//    Int.max >= firstNumber * secondNumber
    // 나눗셈 연산자 구조체
    private struct DivideOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            
            guard secondNumber != 0 else {
                print("0으로는 나눌 수 없습니다.")
                return
            }
            
            let firstNumberStr = firstNumber >= 0 ? "\(firstNumber)" : "(\(firstNumber))"
            let secondNumberStr = secondNumber >= 0 ? "\(secondNumber)" : "(\(secondNumber))"
            
            print("\(firstNumberStr) ➗ \(secondNumberStr) 🟰 \(firstNumber / secondNumber)∙∙∙\(firstNumber % secondNumber)")
        }
    }
    
    // 연산자 열거형
    enum Operator {
        case add
        case substract
        case multiply
        case divide
    }
}


Calculator.calculate(.substract, firstNumber: 10, secondNumber: 3)
Calculator.calculate(.multiply, firstNumber: 10, secondNumber: 3)
Calculator.calculate(.divide, firstNumber: 10, secondNumber: -3)
Calculator.calculate(.divide, firstNumber: 10, secondNumber: 0)

Calculator.calculate(.add, firstNumber: Int.max, secondNumber: 1)
Calculator.calculate(.add, firstNumber: Int.min, secondNumber: -1)

Calculator.calculate(.substract, firstNumber: Int.min, secondNumber: 1)
Calculator.calculate(.substract, firstNumber: -1, secondNumber: Int.max)
