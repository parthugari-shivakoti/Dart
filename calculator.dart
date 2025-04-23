import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1Controller = TextEditingController(text: '20');
  TextEditingController num2Controller = TextEditingController(text: '10');
  String out = "0";

  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      return double.infinity;
    }
    return a / b;
  }

  void performOperation(String operation) {
    if (num1Controller.text.isNotEmpty && num2Controller.text.isNotEmpty) {
      double num1 = double.tryParse(num1Controller.text) ?? 0;
      double num2 = double.tryParse(num2Controller.text) ?? 0;
      double result;

      switch (operation) {
        case '+':
          result = add(num1, num2);
          break;
        case '-':
          result = subtract(num1, num2);
          break;
        case '*':
          result = multiply(num1, num2);
          break;
        case '/':
          result = divide(num1, num2);
          break;
        default:
          result = 0;
      }
      setState(() {
        out = result.toStringAsFixed(2); // Display with 2 decimal places
      });
    } else {
      setState(() {
        out = "Please enter both numbers";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900, // Dark background
      body: Center(
        child: Container(
          width: 300,
          height: 350,// Increased width for better layout
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade800, // Darker container
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,r
                offset: Offset(0, 5), // Shadow to give depth
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Output Display
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.white, // Slightly lighter display
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  out,
                ),
              ),
              SizedBox(height: 20),

              // Input Fields
              TextField(
                controller: num1Controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Colors.white), // White text color
                decoration: InputDecoration(
                  labelText: 'Number 1',
                  labelStyle: TextStyle(color: Colors.grey.shade300),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.deepPurpleAccent), // Highlight on focus
                  ),
                  fillColor: Colors.grey.shade600,
                  filled: true,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Number 2',
                  labelStyle: TextStyle(color: Colors.grey.shade300),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.deepPurpleAccent),
                  ),
                  fillColor: Colors.grey.shade600,
                  filled: true,
                ),
              ),
              SizedBox(height: 40),

              // Buttons Grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildStyledButton(operation: '+', flex: 1),
                  SizedBox(width: 10),
                  _buildStyledButton(operation: '-', flex: 1),
                  SizedBox(width: 10),
                  _buildStyledButton(operation: '*', flex: 1),
                  SizedBox(width: 10),
                  _buildStyledButton(operation: '/', flex: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Styled Button Widget
  Widget _buildStyledButton({required String operation, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () => performOperation(operation),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 5,
          shadowColor: Colors.deepPurple.shade900,
        ),
        child: Text(operation),
      ),
    );
  }
}

