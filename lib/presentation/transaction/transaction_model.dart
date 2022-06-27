import 'package:flutter/material.dart';
import 'package:money/constants/app_icons.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/dimension.dart';
import 'package:time/time.dart';

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
    required this.id,
    required this.type,
    required this.name,
    required this.amount,
    required this.createdAt,
  });
}

List<Transaction> transaction = [
  Transaction(
    id: '12345FDFSA',
    type: TransactionType.pay,
    name: 'eBay',
    amount: '32.50',
    createdAt: DateTime.now(),
  ),
  Transaction(
    id: '12345GKKFLF',
    type: TransactionType.pay,
    name: 'Merton Council',
    amount: '65.55',
    createdAt: DateTime.now(),
  ),
  Transaction(
    id: '12345LKPQEW',
    type: TransactionType.topUp,
    name: 'Top Up',
    amount: '150.05',
    createdAt: DateTime.now(),
  ),
  Transaction(
    id: '95628FDFSA',
    type: TransactionType.pay,
    name: 'Amazon',
    amount: '32.00',
    createdAt: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
  ),
  Transaction(
    id: '12115FDFSA',
    type: TransactionType.pay,
    name: 'John Snow',
    amount: '1400.00',
    createdAt: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 5),
  ),
  Transaction(
    id: '12445FDFSA',
    type: TransactionType.topUp,
    name: 'Top Up',
    amount: '200.00',
    createdAt: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
  ),
];
