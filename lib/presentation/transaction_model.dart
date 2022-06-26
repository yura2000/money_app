enum TransactionType {
  pay,
  topUp,
}

class Transaction {
  final String id;
  final TransactionType type;
  final String name;
  final String amount;
  final DateTime createdAt;

  const Transaction({
    required this.type,
    required this.id,
    required this.name,
    required this.amount,
    required this.createdAt,
  });
}
