import 'package:get/state_manager.dart';
import 'package:money/presentation/transaction/model/transaction_model.dart';
import 'package:nanoid/nanoid.dart';

class TransactionController extends GetxController {
  static String alphabet = '1234567890ABCDEF';
  static String numbers = '1234567890';

  RxString currentAmount = '150.52'.obs;

  List<Transaction> transactions = [
    Transaction(
      id: '12345FDFSA',
      type: TransactionType.pay,
      name: 'eBay',
      amount: '32.50',
      createdAt: currentDate,
      merchantId: '42134',
    ),
    Transaction(
      id: '95628FDFSA',
      type: TransactionType.pay,
      name: 'Amazon',
      amount: '32.00',
      createdAt: currentDate.subtract(const Duration(days: 1)),
      merchantId: '87334',
    ),
    Transaction(
      id: '12345GKKFLF',
      type: TransactionType.pay,
      name: 'Merton Council',
      amount: '65.55',
      createdAt: currentDate,
      merchantId: '75093',
    ),
    Transaction(
      id: '12345LKPQEW',
      type: TransactionType.topUp,
      name: 'Top Up',
      amount: '150.05',
      createdAt: currentDate,
    ),
    Transaction(
      id: '12115FDFSA',
      type: TransactionType.pay,
      name: 'John Snow',
      amount: '1400.00',
      createdAt: currentDate.subtract(const Duration(days: 2)),
      merchantId: '23987',
    ),
    Transaction(
      id: '12445FDFSA',
      type: TransactionType.topUp,
      name: 'Top Up',
      amount: '200.00',
      createdAt: currentDate.subtract(const Duration(days: 1)),
    ),
  ].obs;

  void addTopUpTransaction(String amount) {
    final newTransaction = _createTransaction(
      TransactionType.topUp,
      amount,
    );
    currentAmount.value =
        (double.parse(currentAmount.value) + double.parse(amount))
            .toStringAsFixed(2);
    // integerAmount.value =
    //     int.parse(currentAmount.split('.').first).toStringAsFixed(2);
    // floatAmount.value =
    //     int.parse(currentAmount.split('.').last).toStringAsFixed(2);
    transactions.add(newTransaction);
  }

  void addToWhomTransaction(String amount, String name) {
    final newTransaction = _createTransaction(
      TransactionType.pay,
      amount,
      name: name,
    );
    currentAmount.value =
        (double.parse(currentAmount.value) - double.parse(amount))
            .toStringAsFixed(2);
    // integerAmount.value =
    //     int.parse(currentAmount.split('.').first).toStringAsFixed(2);
    // floatAmount.value =
    //     int.parse(currentAmount.split('.').last).toStringAsFixed(2);
    transactions.add(newTransaction);
  }

  void splitTheCost(Transaction transaction) {
    final halfAmount =
        (double.parse(transaction.amount) / 2).toStringAsFixed(2);

    final newTransaction =
        _createTransaction(TransactionType.topUp, halfAmount);
    currentAmount.value =
        (double.parse(currentAmount.value) + double.parse(halfAmount))
            .toStringAsFixed(2);
    // integerAmount.value =
    //     int.parse(currentAmount.split('.').first).toStringAsFixed(2);
    // floatAmount.value =
    //     int.parse(currentAmount.split('.').last).toStringAsFixed(2);
    transactions.add(newTransaction);
  }

  void addSubscription(Transaction transaction) {
    final newTransaction = _createTransaction(
      TransactionType.pay,
      transaction.amount,
      name: transaction.name,
    );
    currentAmount.value =
        (double.parse(currentAmount.value) - double.parse(transaction.amount))
            .toString();
    // integerAmount.value =
    //     int.parse(currentAmount.split('.').first).toStringAsFixed(2);
    // floatAmount.value =
    //     int.parse(currentAmount.split('.').last).toStringAsFixed(2);
    transactions.add(newTransaction);
  }

  Transaction _createTransaction(TransactionType type, String amount,
      {String name = ''}) {
    DateTime currentDate = DateTime.now();
    switch (type) {
      case TransactionType.pay:
        return Transaction(
            id: customAlphabet(alphabet, 10),
            type: type,
            name: name,
            amount: amount,
            createdAt: currentDate,
            merchantId: customAlphabet(numbers, 5));

      case TransactionType.topUp:
        return Transaction(
          id: customAlphabet(alphabet, 10),
          type: type,
          name: 'Top Up',
          amount: amount,
          createdAt: currentDate,
        );
    }
  }
}
