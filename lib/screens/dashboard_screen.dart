// import 'package:flutter/material.dart';
// import 'package:student_expense_app/services/auth_service.dart';
// import 'package:student_expense_app/services/firestore_service.dart';
// import 'package:student_expense_app/screens/add_expense_screen.dart';
// import 'package:student_expense_app/screens/history_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final firestoreService = FirestoreService(uid: user?.uid ?? '');

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'EduPay Dashboard',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.teal,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout, color: Colors.white),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             _buildSummaryCard(
//               'Total Income',
//               '\$1200',
//               Icons.attach_money,
//               Colors.green,
//             ),
//             const SizedBox(height: 15),
//             _buildSummaryCard(
//               'Total Expenses',
//               '\$800',
//               Icons.money_off,
//               Colors.red,
//             ),
//             const SizedBox(height: 15),
//             _buildSummaryCard(
//               'Balance',
//               '\$400',
//               Icons.account_balance_wallet,
//               Colors.blue,
//             ),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildActionButton(
//                   context,
//                   'Add Income',
//                   Icons.add_circle,
//                   Colors.green,
//                 ),
//                 _buildActionButton(
//                   context,
//                   'Add Expense',
//                   Icons.add_circle_outlined,
//                   Colors.red,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => AddExpenseScreen(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildActionButton(
//                   context,
//                   'Set Budget',
//                   Icons.savings,
//                   Colors.orange,
//                 ),
//                 _buildActionButton(
//                   context,
//                   'History',
//                   Icons.history,
//                   Colors.teal,
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HistoryScreen()),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSummaryCard(
//     String title,
//     String amount,
//     IconData icon,
//     Color color,
//   ) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             backgroundColor: color,
//             child: Icon(icon, color: Colors.white),
//           ),
//           const SizedBox(width: 20),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 amount,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildActionButton(
//     BuildContext context,
//     String label,
//     IconData icon,
//     Color color, {
//     VoidCallback? onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Icon(icon, size: 45, color: color),
//           const SizedBox(height: 10),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//           ),
//         ],
//       ),
//     );
//   }
// }
