import 'dart:io';

void main() {
    print('Enter first number:');
    int num1 = int.parse(stdin.readLineSync()!);

    print('Enter second number:');
    int num2 = int.parse(stdin.readLineSync()!);

    print('Enter third number:');
    int num3 = int.parse(stdin.readLineSync()!);

    int greatest = findGreatest(num1, num2, num3);
    print('The greatest number is: $greatest');
}

int findGreatest(int a, int b, int c) {
    if (a >= b && a >= c) {
        return a;
    } else if (b >= a && b >= c) {
        return b;
    } else {
        return c;
    }
}