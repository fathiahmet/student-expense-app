import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/expense_model.dart';
import '../utils/design_system.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _amountCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  String _selectedCategory = 'Food';
  final List<String> _categories = [
    'Food',
    'Transport',
    'Books',
    'Entertainment',
    'Other',
  ];
  bool _isLoading = false;

  void _saveExpense() async {
    if (_amountCtrl.text.isEmpty) return;
    setState(() => _isLoading = true);
    final expense = ExpenseModel(
      id: '',
      amount: double.parse(_amountCtrl.text),
      category: _selectedCategory,
      description: _descCtrl.text,
      date: DateTime.now(),
    );
    await FirestoreService().addExpense(expense);
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            LabeledInput(
              label: 'Amount (\$)',
              hint: '0.00',
              prefixIcon: Icons.money_off,
              controller: _amountCtrl,
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField<String>(
              initialValue: _selectedCategory,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.inputBg,
                prefixIcon: const Icon(
                  Icons.category,
                  color: AppColors.textLight,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              items: _categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (val) => setState(() => _selectedCategory = val!),
            ),
            const SizedBox(height: 20),
            LabeledInput(
              label: 'Description',
              hint: 'What was this for?',
              prefixIcon: Icons.description,
              controller: _descCtrl,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Save Expense',
              onPressed: _saveExpense,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
