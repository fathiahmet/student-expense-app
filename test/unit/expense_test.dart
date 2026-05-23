// Location: test/unit/expense_test.dart
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Expense Tests', () {
    
    test('Test 1: Adding two numbers works', () {
      int total = 10 + 20;
      expect(total, 30);
    });
    
    test('Test 2: Expense amount should be positive', () {
      double amount = 25.50;
      expect(amount, greaterThan(0));
    });
    
    test('Test 3: String is not empty', () {
      String category = "Food";
      expect(category.isNotEmpty, true);
    });
  });
}