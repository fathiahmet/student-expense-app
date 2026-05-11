class ExpenseModel {
  final String id;
  final double amount;
  final String category;
  final String description;
  final DateTime date;

  ExpenseModel({
    required this.id,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> data, String documentId) {
    return ExpenseModel(
      id: documentId,
      amount: (data['amount'] ?? 0.0).toDouble(),
      category: data['category'] ?? 'Other',
      description: data['description'] ?? '',
      date: data['date'] != null ? data['date'].toDate() : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'category': category,
      'description': description,
      'date': date,
    };
  }
}
