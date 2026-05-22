import 'package:flutter/material.dart';

class IncomeCard extends StatelessWidget {
  final String title;
  final String amount;
  final String date;

  const IncomeCard({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.trending_up, color: Colors.white),
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
