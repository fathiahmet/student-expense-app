import 'package:flutter/material.dart';
//import '../utils/design_system.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  const ExpenseCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.trending_down, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(date),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(amount), Text(date)],
        ),
      ),
    );
  }
}
