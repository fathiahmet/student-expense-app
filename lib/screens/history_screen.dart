// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../services/firestore_service.dart';
// import '../utils/app_colors.dart';

// class HistoryScreen extends StatelessWidget {
//   const HistoryScreen({super.key});

//   //Help on icons based on category
//   IconData _getCategoryIcon(String category) {
//     switch (category) {
//       case 'Food':
//         return Icons.fastfood;
//       case 'Transportation':
//         return Icons.directions_car;
//       case 'Entertainment':
//         return Icons.movie;
//       case 'Utilities':
//         return Icons.light_mode;
//       case 'Books':
//         return Icons.book;
//       default:
//         return Icons
//             .category; //Icons.money_off; //[span_8](start_span) [span_8](end_span)
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final firestoreService = FirestoreService(uid: user?.uid ?? '');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Expense History',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: AppColors.primaryTeal,
//       ),

//       //StreamBuilder to listen to real-time updates from Firestore
//       body: StreamBuilder<QuerySnapshot>(
//         stream: firestoreService.getExpensesStream(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Error loading expenses'));
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           final expenses = snapshot.data!.docs;
//           if (expenses.isEmpty) {
//             return Center(child: Text('No expenses recorded yet'));
//           }

//           //ListView to display expenses

//           return ListView.builder(
//             itemCount: expenses.length,
//             itemBuilder: (context, index) {
//               final expense = expenses[index];
//               final expenseId = expense.id;
//               final category = expense['category'] ?? 'Other';
//               final amount = expense['amount'] ?? 0.0;
//               final description = expense['description'] ?? '';
//               final timestamp = expense['date'] as Timestamp?;
//               final date = timestamp != null
//                   ? timestamp.toDate()
//                   : DateTime.now();

//               //listTile with previous and new icons

//               return Card(
//                 elevation: 2,
//                 margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                 child: ListTile(
//                   leading: CircleAvatar(
//                     backgroundColor: Colors.redAccent.withOpacity(0.1),
//                     child: Icon(
//                       _getCategoryIcon(category),
//                       color: Colors.redAccent,
//                     ),
//                   ),
//                   title: Text(
//                     "$category: - \$$amount",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(description),
//                   trailing: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       //Edit icon
//                       IconButton(
//                         icon: Icon(Icons.edit, color: Colors.blueAccent),
//                         onPressed: () {
//                           //Navigate to edit screen

//                           scaffoldMessenger
//                               .of(context)
//                               .showSnackBar(
//                                 const SnackBar(
//                                   content: Text('Edit feature coming soon!'),
//                                 ),
//                               );
//                         },
//                       ),
//                       //Delete icon
//                       IconButton(
//                         icon: Icon(Icons.delete, color: Colors.redAccent),
//                         onPressed: () async {
//                           await firestoreService.deleteExpense(expenseId);
//                           //Delete expense from Firestore
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text('Expense deleted')),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
