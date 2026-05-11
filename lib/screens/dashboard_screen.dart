import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../models/expense_model.dart';
import '../models/income_model.dart';
import '../utils/design_system.dart';
import 'add_income.dart';
import 'add_expense.dart';
import '../screens/history_screen.dart';
import '../screens/budget_screen.dart';
import '../screens/profile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final FirestoreService _db = FirestoreService();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Screens list is fine here, but we ensure the ProfileScreen is the one we fixed earlier
    final screens = [
      _buildDashboardContent(),
      const HistoryScreen(),
      const BudgetScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        // Use IndexedStack to maintain state between tabs
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Essential for 4 or more items
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Budget',
          ), // Fixed Icon
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ), // Fixed Icon
        ],
      ),
    );
  }

  Widget _buildDashboardContent() {
    return SafeArea(
      child: SingleChildScrollView(
        // Added scroll view to prevent overflow on small screens
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),

            // Nested StreamBuilders for Income and Expenses
            StreamBuilder<List<IncomeModel>>(
              stream: _db.getIncomes(),
              builder: (context, incomeSnap) {
                if (incomeSnap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final incomes = incomeSnap.data ?? [];
                final totalIncome = incomes.fold(
                  0.0,
                  (sum, item) => sum + item.amount,
                );

                return StreamBuilder<List<ExpenseModel>>(
                  stream: _db.getExpenses(),
                  builder: (context, expenseSnap) {
                    final expenses = expenseSnap.data ?? [];
                    final totalExpense = expenses.fold(
                      0.0,
                      (sum, item) => sum + item.amount,
                    );
                    final balance = totalIncome - totalExpense;

                    return Column(
                      children: [
                        _buildSummaryCard(
                          'Balance',
                          balance,
                          Icons.account_balance_wallet,
                          AppColors.primary,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildSummaryCard(
                                'Income',
                                totalIncome,
                                Icons.attach_money,
                                AppColors.success,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildSummaryCard(
                                'Expense',
                                totalExpense,
                                Icons.money_off,
                                AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 30),
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  Icons.add_circle,
                  'Add Income',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddIncomeScreen()),
                  ),
                ),
                _buildActionButton(
                  Icons.remove_circle_outline,
                  'Add Expense',
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    double amount,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: title == 'Balance' ? 30 : 22, // Adjusted sizes slightly
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.inputBg,
            child: Icon(icon, color: AppColors.primary, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
