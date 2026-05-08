class IncomeModel {
  final String id;
  final String category;
  final double amount;
  final String description;
  final DateTime date;

  IncomeModel({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.description,
  });
  //CONVERT a Map from the database(firestore) to an IncomeModel object
  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
      id: map['id'] ?? '',
      category: map['category'] ?? 'salary',
      amount: (map['amount'] ?? 0.0).toDouble(),
      date: map['date'] != null ? DateTime.parse(map['date']) : DateTime.now(),
      description: map['description'] ?? '',
    );
  }
  //CONVERT an IncomeModel object to a Map to save to the database(firestore)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'amount': amount,
      'date': date.toIso8601String(),
      'description': description,
    };
  }
}
