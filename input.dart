import 'dart:io';

void main() {
    // Reading a string input
    print('Enter a string:');
    String? inputString = stdin.readLineSync();
    print('You entered: $inputString');

    // Reading an integer input
    print('Enter an integer:');
    int? inputInt = int.parse(stdin.readLineSync()!);
    print('You entered: $inputInt');

    // Reading a double input
    print('Enter a double:');
    double? inputDouble = double.parse(stdin.readLineSync()!);
    print('You entered: $inputDouble');

    // Reading a boolean input
    print('Enter a boolean (true/false):');
    bool? inputBool = stdin.readLineSync()!.toLowerCase() == 'true';
    print('You entered: $inputBool');
}