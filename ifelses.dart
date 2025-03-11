import 'dart:io';

void main() {
    print("Enter your age:");
    int age = int.parse(stdin.readLineSync()!);

    if (age >= 0) {
        if (age < 18) {
            print("You are a minor.");
        } else {
            if (age <= 60) {
                print("You are an adult.");
            } else {
                print("You are a senior citizen.");
            }
        }
    } else {
        print("Invalid age.");
    }
}