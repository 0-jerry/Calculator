//
//  Calculator.swift
//  Calculator
//
//  Created by t2023-m0072 on 10/28/24.
//

import Foundation

//MARK: - 계산기 구조체
struct Calculator {
    // Operator 열거형을 통해 연산자 입력
    static func calculate(_ operator: Operator, firstNumber: Int, secondNumber: Int) {
        switch `operator`{
        case .add:
            AddOperation().calculate(firstNumber, secondNumber)
            
        case .substract:
            SubstractOperation().calculate(firstNumber, secondNumber)
            
        case .multiply:
            MultiplyOperation().calculate(firstNumber, secondNumber)
            
        case .divide:
            DivideOperation().calculate(firstNumber,secondNumber)
        }
    }
}

//MARK: - 연산자 열거형
enum Operator: CustomStringConvertible {
    
    case add
    case substract
    case multiply
    case divide
    
    var description: String {
        switch self {
        case .add: return "➕"
        case .substract: return "➖"
        case .multiply: return "✖️"
        case .divide: return "➗"
        }
    }
}




//MARK: - 추상 연산 프로토콜
// result 메서드 필수 구현
// calculate 메서드를 통해 에러 처리 후 결과값 출력
private protocol AbstractOperation {
    
    static var `operator`: Operator { get }
    
    func result(_ firstNumber: Int, _ secondNumber: Int) throws -> Int
}

extension AbstractOperation {
    
    func calculate(_ firstNumber: Int, _ secondNumber: Int) {
        do {
            let result = try result(firstNumber,secondNumber)
            
            printResult(firstNumber, secondNumber, result)
            
        //에러처리
        } catch AbstractOperationError.overFlow {
            print("\(convertTo(firstNumber)) \(Self.`operator`.description) \(convertTo(secondNumber)) 연산은 오버플로우가 발생합니다.")
        } catch AbstractOperationError.underFlow{
            print("\(convertTo(firstNumber)) \(Self.`operator`.description) \(convertTo(secondNumber)) 연산은 언더플로우가 발생합니다.")
        } catch AbstractOperationError.divideByZero {
            print("\(convertTo(secondNumber))으로는 나눌 수 없습니다.")
        } catch {
            print("알 수 없는 에러")
        }
    }
    
    private func convertTo(_ number: Int) -> String {
        number >= 0 ? "\(number)" : "(\(number))"
    }
    
    private func printResult(_ firstNumber: Int, _ secondNumber: Int,_ result: Int) {
        print("\(convertTo(firstNumber)) \(Self.`operator`.description) \(convertTo(secondNumber)) = \(result)")
    }
}

//MARK: - 추상 연산 에러
enum AbstractOperationError: Error {
    case divideByZero(_ secondNumber: Int)
    case overFlow(_ firstNumber: Int, _ secondNumber: Int)
    case underFlow(_ firstNumber: Int, _ secondNumber: Int)
}


//MARK: - 덧셈 연산 구조체
struct AddOperation: AbstractOperation {
    
    static let `operator`: Operator = .add
    
    func result(_ firstNumber: Int, _ secondNumber: Int) throws -> Int {
        try checkOverFlow(firstNumber, secondNumber)
        try checkUnderFlow(firstNumber, secondNumber)

        return firstNumber + secondNumber
    }
    
    //오버 플로우 에러 처리
    private func checkOverFlow(_ firstNumber: Int,_ secondNumber: Int) throws {
        guard Decimal(firstNumber) + Decimal(secondNumber) <= Decimal(Int.max) else {
            throw AbstractOperationError.overFlow(firstNumber, secondNumber)
        }
    }
    
    //언더 플로우 에러 처리
    private func checkUnderFlow(_ firstNumber: Int,_ secondNumber: Int) throws {
        guard Decimal(firstNumber) + Decimal(secondNumber) >= Decimal(Int.min) else {
            throw AbstractOperationError.overFlow(firstNumber, secondNumber)
        }
    }
}


//MARK: - 뺄셈 연산 구조체
struct SubstractOperation: AbstractOperation {
    
    static let `operator`: Operator = .substract
    
    func result(_ firstNumber: Int, _ secondNumber: Int) throws -> Int {
        try checkOverFlow(firstNumber, secondNumber)
        try checkUnberFlow(firstNumber, secondNumber)
        
        return firstNumber + secondNumber
    }
    
    //오버 플로우 에러 처리
    private func checkOverFlow(_ firstNumber: Int,_ secondNumber: Int) throws {
        guard Decimal(firstNumber) - Decimal(secondNumber) <= Decimal(Int.max) else {
            throw AbstractOperationError.overFlow(firstNumber, secondNumber)
        }
    }
    
    //언더 플로우 에러 처리
    private func checkUnberFlow(_ firstNumber: Int,_ secondNumber: Int) throws {
        guard Decimal(firstNumber) - Decimal(secondNumber) >= Decimal(Int.min) else {
            throw AbstractOperationError.underFlow(firstNumber, secondNumber)
        }
    }
}



//MARK: - 곱셈 연산 구조체
struct MultiplyOperation: AbstractOperation {
    
    static let `operator`: Operator = .multiply
    
    func result(_ firstNumber: Int, _ secondNumber: Int) throws -> Int {
        try checkOverFlow(firstNumber, secondNumber)
        try checkUnderFlow(firstNumber, secondNumber)
        
        return firstNumber * secondNumber
    }
    
    //오버 플로우 에러 처리
    private func checkOverFlow(_ firstNumber: Int, _ secondNumber: Int) throws {
        guard Decimal(firstNumber) * Decimal(secondNumber) <= Decimal(Int.max) else {
            throw AbstractOperationError.overFlow(firstNumber, secondNumber)
        }
    }
    
    //언더 플로우 에러 처리
    private func checkUnderFlow(_ firstNumber: Int, _ secondNumber: Int) throws {
        guard Decimal(firstNumber) * Decimal(secondNumber) >= Decimal(Int.min) else {
            throw AbstractOperationError.underFlow(firstNumber, secondNumber)
        }
    }
}


//MARK: - 나눗셈 연산 구조체
struct DivideOperation: AbstractOperation {
    
    static let `operator`: Operator = .divide
    
    func result(_ firstNumber: Int, _ secondNumber: Int) throws -> Int {
        try checkDivideByZero(secondNumber)
        
        return firstNumber / secondNumber
    }
    
    //0으로 나누는 경우 에러 처리
    private func checkDivideByZero(_ secondNumber: Int) throws {
        guard secondNumber != 0 else {
            throw AbstractOperationError.divideByZero(secondNumber)
        }
    }
}
