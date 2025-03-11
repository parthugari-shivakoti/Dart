import 'dart:io';

void main() {
    print("Enter the first number:");
    int num1 = int.parse(stdin.readLineSync()!);

    print("Enter the second number:");
    int num2 = int.parse(stdin.readLineSync()!);

    int greatest = findGreatest(num1, num2);
    print("The greatest number is: $greatest");
}

int findGreatest(int a, int b) {
    return (a > b) ? a : b;
}