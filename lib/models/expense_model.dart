class ExpenseModel {
  final String id;
  final String category;
  final double amount;
  final DateTime date;
  final String description;

  ExpenseModel({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.description,
  });
}
