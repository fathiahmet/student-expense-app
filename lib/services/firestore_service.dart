// import 'package: cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   final String uid;
//   FirestoreService({required this.uid});

//   //Users collection reference
//   final CollectionReference userCollection = FirebaseFirestore.instance
//       .collection('users');

//   //Add expense
//   Future<void> addExpense(
//     String category,
//     double amount,
//     String description,
//   ) async {
//     return await userCollection.doc(uid).collection('expenses').add({
//       'category': category,
//       'amount': amount,
//       'description': description,
//       'date': Timestamp.now(),
//     });
//   }
// }

// //Add income
// Future<void> addIncome(String source, double amount, String description) async {
//   return await userCollection.doc(uid).collection('incomes').add({
//     'source': source,
//     'amount': amount,
//     'description': description,
//     'date': Timestamp.now(),
//   });
// }

// //Real-time stream of expenses
// Stream<QuerySnapshot> get expenses {
//   return userCollection.doc(uid).collection('expenses').snapshots();
// }

// Future<void> deleteExpense(String expenseId) async {
//   return await userCollection
//       .doc(uid)
//       .collection('expenses')
//       .doc(expenseId)
//       .delete();
// }
