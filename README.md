# 계산기

## Calculator 구조체
`static func calculate(_ operator: Self.Operator, firstNumber: Int, secondNumber: Int)`
- 정적 메서드를 통해 Int 정수형에 대한 덧셈, 뺄셈, 곱셈, 나눗셈을 지원
- Calculator.Operator 열거형을 통해 연산방식 선택

</br>
</br>

### AbstractOperation 프로토콜
`static func calculate(_ firstNumber: Int, _ secondNumber: Int)`


</br>

### AddOperation 구조체 
- AbstractOperation 프로토콜 준수
- `static func calculate(_ firstNumber: Int, _ secondNumber: Int)`
    - "firstNumber + secondNumber = 연산결과" 출력

</br>

### SubstractOperation 구조체
- AbstractOperation 프로토콜 준수
- `static func calculate(_ firstNumber: Int, _ secondNumber: Int)`
    - "firstNumber - secondNumber = 연산결과" 출력

</br>

### MultiplyOperation 구조체
- AbstractOperation 프로토콜 준수
- `static func calculate(_ firstNumber: Int, _ secondNumber: Int)`
    - "firstNumber * secondNumber = 연산결과" 출력

</br>

### DivideOperation 구조체
- AbstractOperation 프로토콜 준수
- `static func calculate(_ firstNumber: Int, _ secondNumber: Int)`
    - "firstNumber / secondNumber = 몫∙∙∙나머지" 출력

</br>

### Operator 열거형
- add, substract, multiply, divide
