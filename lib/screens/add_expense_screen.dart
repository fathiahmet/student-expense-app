// import 'package:flutter/material.dart';
// import '../utils/app_colors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../services/firestore_service.dart';

// class AddExpenseScreen extends StatefulWidget {
//   const AddExpenseScreen({super.key});

//   @override
//   State<AddExpenseScreen> createState() => _AddExpenseScreenState();
// }

// class _AddExpenseScreenState extends State<AddExpenseScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   //Predefined categories
//   String? _selectedCategory;
//   final List<String> _categories = ['Food', 'Transportation', 'Entertainment', 'Utilities', 'Books', 'Other'];

//   bool _isLoading = false;
//   void _submitExpense() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//       try {
//         final user = FirebaseAuth.instance.currentUser;
//         final firestoreService = FirestoreService(uid: user?.uid ?? '');
//         await firestoreService.addExpense(
//           _selectedCategory!,
//           double.parse(_amountController.text),
//           _descriptionController.text,
//         );

//         setState(() => _isLoading = false);
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Expense added successfully!')),
//           );
//           Navigator.pop(context);//Go back to dashboard
//        }
//      }
//    }

//    @override
//    Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Add Expense',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //Amount input field
//               TextFormField(
//                 controller: _amountController,
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 decoration: InputDecoration(
//                   labelText: 'Amount(\$)',
//                   prefixIcon: Icon(Icons.attach_money),
//                   hintText: 'Enter amount',
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) return 'Please enter an amount';
//                   if (double.tryParse(value) == null) return 'Please enter a valid number';
//                   return null;
//                 },
//                 ),
//               )
//               const SizedBox(height: 20),

//               //Category dropdown
//               // const Text('Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//               // const SizedBox(height: 8),
//               DropdownButtonFormField<String>(
//                 initialValue: _selectedCategory,
//                 decoration: InputDecoration(
//                   labelText: 'Category',
//                   prefixIcon: Icon(Icons.category),
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                 ),
//                 items: _categories.map((category) {
//                   return DropdownMenuItem<String>(
//                     value: category,
//                     child: Text(category),
//                   );
//                 }).toList(),
//                 onChanged: (value) => setState(() => _selectedCategory = value),
//                 validator: (value) => value == null ? 'Please select a category' : null,
//                 ),
//               const SizedBox(height: 20),

//               //Description field
//               TextFormField(
//                 controller: _descriptionController,
//                 maxLines: 3,
//                 validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
//                 decoration: InputDecoration(
//                   labelText: 'Description',
//                   prefixIcon: Icon(Icons.description),
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//                   // hintText: 'Enter description (optional)',
//                   validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
//                   contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                 ),
//               ),

//               //Save button
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 height: 55,
//                 child: ElevatedButton.icon(
//                   icon: _isLoading ? CircularProgressIndicator(color: Colors.white):const Icon(Icons.add.circle_outline, color: Colors.white,),
//                   label: const Text('Save Expense', style: TextStyle(color: Colors.white,
//                   fontSize: 18, 
//                   ),
//                   ),

//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.redAccent,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),

//                     onPressed: _isLoading ? null : _submitExpense,
//                  ),
//                ),
//             ],
//         ),
//            ),  
//          ),
//        )
//    }
//  }
