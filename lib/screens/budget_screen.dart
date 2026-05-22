import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../utils/design_system.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final _budgetCtrl = TextEditingController();
  bool _isLoading = false;

  void _saveBudget() async {
    if (_budgetCtrl.text.isEmpty) return;
    setState(() => _isLoading = true);
    await FirestoreService().setBudget(double.parse(_budgetCtrl.text));
    setState(() => _isLoading = false);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Budget updated!'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monthly Budget')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            StreamBuilder<double>(
              stream: FirestoreService().getBudget(),
              builder: (context, snapshot) {
                return Text(
                  'Current Budget: \$${(snapshot.data ?? 0.0).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            LabeledInput(
              label: 'New Monthly Budget (\$)',
              hint: '0.00',
              prefixIcon: Icons.savings,
              controller: _budgetCtrl,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Save Budget',
              onPressed: _saveBudget,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
