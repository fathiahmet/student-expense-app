class IncomeModel {
  final String id;
  final double amount;
  final String source;
  final DateTime date;

  IncomeModel({
    required this.id,
    required this.amount,
    required this.source,
    required this.date,
  });

  factory IncomeModel.fromMap(Map<String, dynamic> data, String documentId) {
    return IncomeModel(
      id: documentId,
      amount: (data['amount'] ?? 0.0).toDouble(),
      source: data['source'] ?? 'Unknown',
      date: data['date'] != null ? data['date'].toDate() : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'amount': amount, 'source': source, 'date': date};
  }
}
