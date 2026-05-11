import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/expense_model.dart';
import '../models/income_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get _userId => _auth.currentUser?.uid;

  // --- Expenses ---
  Stream<List<ExpenseModel>> getExpenses() {
    if (_userId == null) return Stream.value([]);
    return _db
        .collection('users')
        .doc(_userId)
        .collection('expenses')
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ExpenseModel.fromMap(doc.data(), doc.id))
              .toList(),
        );
  }

  Future<void> addExpense(ExpenseModel expense) async {
    if (_userId != null) {
      await _db
          .collection('users')
          .doc(_userId)
          .collection('expenses')
          .add(expense.toMap());
    }
  }

  Future<void> deleteExpense(String id) async {
    if (_userId != null) {
      await _db
          .collection('users')
          .doc(_userId)
          .collection('expenses')
          .doc(id)
          .delete();
    }
  }

  // --- Income ---
  Stream<List<IncomeModel>> getIncomes() {
    if (_userId == null) return Stream.value([]);
    return _db
        .collection('users')
        .doc(_userId)
        .collection('income')
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => IncomeModel.fromMap(doc.data(), doc.id))
              .toList(),
        );
  }

  Future<void> addIncome(IncomeModel income) async {
    if (_userId != null) {
      await _db
          .collection('users')
          .doc(_userId)
          .collection('income')
          .add(income.toMap());
    }
  }

  // --- Budget ---
  Future<void> setBudget(double amount) async {
    if (_userId != null) {
      await _db
          .collection('users')
          .doc(_userId)
          .collection('budget')
          .doc('current')
          .set({
            'monthly_budget': amount,
            'set_date': FieldValue.serverTimestamp(),
          });
    }
  }

  Stream<double> getBudget() {
    if (_userId == null) return Stream.value(0.0);
    return _db
        .collection('users')
        .doc(_userId)
        .collection('budget')
        .doc('current')
        .snapshots()
        .map((doc) {
          if (doc.exists && doc.data() != null) {
            return (doc.data()!['monthly_budget'] ?? 0.0).toDouble();
          }
          return 0.0;
        });
  }
}
