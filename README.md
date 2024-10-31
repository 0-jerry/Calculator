# Calculator
간단한 사칙연산 계산기입니다. Int 타입의 범위를 고려한 오버플로우/언더플로우 처리와 0으로 나누기 예외처리를 포함합니다.

</br>

### 기능

덧셈(+), 뺄셈(-), 곱셈(*), 나눗셈(/) 연산 지원
Int 타입 범위를 벗어나는 연산 시 오버플로우/언더플로우 에러 처리
0으로 나누기 시도 시 에러 처리
음수는 괄호로 표시

```swift
// 기본 사용
Calculator.calculate(.add, firstNumber: 10, secondNumber: 5)      // 10 ➕ 5 = 15
Calculator.calculate(.substract, firstNumber: 10, secondNumber: 5) // 10 ➖ 5 = 5
Calculator.calculate(.multiply, firstNumber: 10, secondNumber: 5)  // 10 ✖️ 5 = 50
Calculator.calculate(.divide, firstNumber: 10, secondNumber: 5)    // 10 ➗ 5 = 2

// 음수 처리
Calculator.calculate(.add, firstNumber: -10, secondNumber: 5)     // (-10) ➕ 5 = -5

// 에러 처리
// 오버플로우
Calculator.calculate(.add, firstNumber: Int.max, secondNumber: 1)  
// 9223372036854775807 ➕ 1 연산은 오버플로우가 발생합니다.

// 0으로 나누기
Calculator.calculate(.divide, firstNumber: 10, secondNumber: 0)    
// 0으로는 나눌 수 없습니다.
```
