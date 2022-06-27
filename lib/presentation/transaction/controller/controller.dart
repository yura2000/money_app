import 'package:get/state_manager.dart';

class TransactionController extends GetxController {
  void addTopUpTransaction(String amount) {
    print(amount);
  }

  void addToWhomTransaction(String amount, String name) {
    print('${amount} to ${name}');
  }
}
