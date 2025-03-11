import 'dart:io';

void main() {
    print('Enter first number:');
    int a = int.parse(stdin.readLineSync()!);

    print('Enter second number:');
    int b = int.parse(stdin.readLineSync()!);

    print('Addition: ${add(a, b)}');
    print('Subtraction: ${subtract(a, b)}');
    print('Multiplication: ${multiply(a, b)}');
    print('Division: ${divide(a, b)}');
    print('Modulus: ${modulus(a, b)}');
}

int add(int a, int b) {
    return a + b;
}

int subtract(int a, int b) {
    return a - b;
}

int multiply(int a, int b) {
    return a * b;
}

double divide(int a, int b) {
    if (b == 0) {
        throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
}

int modulus(int a, int b) {
    return a % b;
}