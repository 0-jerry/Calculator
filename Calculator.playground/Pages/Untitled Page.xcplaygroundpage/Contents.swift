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
            
            //두 수의 합이 Int.max 초과 또는 Int.min 미만
            guard (firstNumber > 0 && Int.max - firstNumber >= secondNumber) ||
                    (firstNumber < 0 && Int.min - firstNumber <= secondNumber) ||
                    (firstNumber == 0) || (secondNumber == 0) else {
                print("연산 범위를 초과하였습니다.")
                return
            }
            
            let firstNumberStr = firstNumber >= 0 ? "\(firstNumber)" : "(\(firstNumber))"
            let secondNumberStr = secondNumber >= 0 ? "\(secondNumber)" : "(\(secondNumber))"
            
            print("\(firstNumberStr) ➕ \(secondNumberStr) 🟰 \(firstNumber + secondNumber)")
        }
    }
    
    // 뺄셈 연산자 구조체
    private struct SubstractOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            
            //두 수의 차가 Int.max 초과 또는 Int.min 미만
            guard (firstNumber == 0) || (secondNumber == 0) ||
                    (firstNumber > 0 && Int.max - firstNumber <= secondNumber) ||
                    (firstNumber < 0 && firstNumber - Int.min >= secondNumber ) else {
                print("연산 범위를 초과하였습니다.")
                return
            }
            
            let firstNumberStr = firstNumber >= 0 ? "\(firstNumber)" : "(\(firstNumber))"
            let secondNumberStr = secondNumber >= 0 ? "\(secondNumber)" : "(\(secondNumber))"
            
            print("\(firstNumberStr) ➖ \(secondNumberStr) 🟰 \(firstNumber - secondNumber)")
        }
    }
    
    // 곱셈 연산자 구조체
    private struct MultiplyOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            
            let firstNumberStr = firstNumber >= 0 ? "\(firstNumber)" : "(\(firstNumber))"
            let secondNumberStr = secondNumber >= 0 ? "\(secondNumber)" : "(\(secondNumber))"
            
            // 특수 케이스 연산 (0 또는 1을 포함할 경우)
            if [0,1].contains(firstNumber) || [0,1].contains(secondNumber) {
                print("\(firstNumberStr) ✖️ \(secondNumberStr) 🟰 \(firstNumber * secondNumber)")
                return
            }
            
            //firstNumber나 secondNumber가 Int.min일 경우
            guard firstNumber != Int.min && secondNumber != Int.min else {
                print("연산 범위를 초과하였습니다.")
                return
            }
            
            let firstNumberAbs = abs(firstNumber)
            let secondNumberAbs = abs(secondNumber)
            
            //두 수의 절대값의 곱이 Int.max 이상일 경우 (단, Int의 나누기 연산으로 인해 오차 발생 가능)
            guard (firstNumberAbs <= Int.max / secondNumberAbs) else {
                print("연산 범위를 초과하였습니다.")
                return
            }
            
            print("\(firstNumberStr) ✖️ \(secondNumberStr) 🟰 \(firstNumber * secondNumber)")
        }
    }
    
    // 나눗셈 연산자 구조체
    private struct DivideOperation: AbstractOperation {
        static func calculate(_ firstNumber: Int,_ secondNumber: Int) {
            
            //나누기 인자가 0일 경우
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
