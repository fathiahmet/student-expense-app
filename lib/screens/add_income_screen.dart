// import 'package:flutter/material.dart';
// import '../models/income_model.dart';

// class AddIncomeScreen extends StatefulWidget {
//   const AddIncomeScreen({super.key});

//   @override
//   State<AddIncomeScreen> createState() => _AddIncomeScreenState();
// }

// class _AddIncomeScreenState extends State<AddIncomeScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController _amountController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();

//   String _selectedCategory = 'salary';
//   DateTime _selectedDate = DateTime.now();
// }
// final List<String> _categories = [
//     'salary',
//     'freelance',
//     'investment',
//     'gift',
//     'other'
//   ];
//   void _presentDatePicker() async {
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate,
//       firstDate: DateTime(2020),
//       lastDate: DateTime.now(),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     }
//   }
    
//     void _submitData() {
//       if (!_formKey.currentState!.validate()) return;
//       //creating the model instance 
//       final newIncome = IncomeModel(
//         id: DateTime.now().toString(),//Temporary ID generation
//         category: _selectedCategory,
//         amount: double.parse(_amountController.text),
//         date: _selectedDate,
//         description: _descriptionController.text,
//       );
//       //call firebase service here to save the newIncome object to the database

//       databaseService.addIncome(newIncome);

//       print(" New Income Added: ${newIncome.amount} in category ${newIncome.category} on ${newIncome.date} with description: ${newIncome.description}");

//       Navigator.of(context).pop(); // Close the add income screen after submission
//       //go back to the previous screen (home screen) after adding the income
//     }

//     @override
//     void dispose(){
//       _amountController.dispose();
//       _descriptionController.dispose();
//       super.dispose();
//     }
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text("Add Income"),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 // Amount input field
//                 TextFormField(
//                   controller: _amountController,
//                   keyboardType: TextInputType.number,
//                   decoration: const InputDecoration(labelText: 'Amount'),
//                   prefixIcon: Icon(Icons.attach_money),
//                   border: OutlineInputBorder(),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter an amount';
//                     }
//                     if (double.tryParse(value) == null) {
//                       return 'Please enter a valid number';
//                     }
//                     return null;
//                   },
//                 ),
//                   const SizedBox(height: 20),
//                   // category dropdown
//                 DropdownButtonFormField<String>(
//                   initialValue: _selectedCategory,
//                   decoration: const InputDecoration(
//                     labelText: 'Category',
//                     prefixIcon: Icon(Icons.category),
//                     border: OutlineInputBorder(),
//                   ),
//                   items: _categories.map((category) {
//                     return DropdownMenuItem<String>(
//                       value: category,
//                       child: Text(category),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedCategory = value!;
//                     });
//                   },
//                   const SizedBox(height: 20),
//                   // date picker row
//                   InkWell(
//                     onTap: _presentDatePicker,
//                     child: InputDecorator(
//                       decoration: const InputDecoration(
//                         labelText: 'Date',
//                         border: OutlineInputBorder(),
//                         prefixIcon: Icon(Icons.calendar_today),
//                   ),
//                       child: Text(
//                         "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
//                 ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // description input field
//                   TextFormField(
//                     controller: _descriptionController,
//                     decoration: const InputDecoration(
//                       labelText: 'Description',
//                       border: OutlineInputBorder(),
//                       prefixIcon: Icon(Icons.description),
//                     ),
//                     maxLines: 3,
//                   ),

//                   const SizedBox(height: 20),

//                   // submit button
//                   ElevatedButton(
//                     onPressed: _submitData,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: const Text('Save Income', style: TextStyle(fontSize: 16)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//       );
//   }
// }
  
