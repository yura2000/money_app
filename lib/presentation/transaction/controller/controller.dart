import 'package:get/state_manager.dart';
import 'package:money/presentation/transaction/model/transaction_model.dart';

class TransactionController extends GetxController {
  void addTopUpTransaction(String amount) {
    print(amount);
  }

  void addToWhomTransaction(String amount, String name) {
    print('${amount} to ${name}');
  }

  void splitTheCost(Transaction transaction) {}

  void addSubscription(Transaction transaction) {}
}
