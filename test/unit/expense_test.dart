// Location: test/unit/expense_test.dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Expense Tests', () {
    
    test('Test 1: Adding two numbers works', () {
      int total = 10 + 20;
      expect(total, 30);
      print('Test 1 passed: 10 + 20 equals $total');
    });
    
    test('Test 2: Expense amount should be positive', () {
      double amount = 25.50;
      expect(amount, greaterThan(0));
      print('Test 2 passed: Expense amount $amount is positive');
    });
    
    test('Test 3: String is not empty', () {
      String category = "Food";
      expect(category.isNotEmpty, true);
      print('Test 3 passed: Category "$category" is not empty');
    });
  });
}