import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/income_model.dart';
import '../utils/design_system.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({Key? key}) : super(key: key);

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  final _amountCtrl = TextEditingController();
  final _sourceCtrl = TextEditingController();
  bool _isLoading = false;

  void _saveIncome() async {
    if (_amountCtrl.text.isEmpty || _sourceCtrl.text.isEmpty) return;
    setState(() => _isLoading = true);
    final income = IncomeModel(
      id: '',
      amount: double.parse(_amountCtrl.text),
      source: _sourceCtrl.text,
      date: DateTime.now(),
    );
    await FirestoreService().addIncome(income);
    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Income')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            LabeledInput(
              label: 'Amount (\$)',
              hint: '0.00',
              prefixIcon: Icons.attach_money,
              controller: _amountCtrl,
              keyboardType: TextInputType.number,
            ),
            LabeledInput(
              label: 'Source',
              hint: 'e.g., Parents, Scholarship',
              prefixIcon: Icons.source,
              controller: _sourceCtrl,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Save Income',
              onPressed: _saveIncome,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
