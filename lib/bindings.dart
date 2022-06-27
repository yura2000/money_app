import 'package:get/instance_manager.dart';
import 'package:money/presentation/top_up/controller/controller.dart';
import 'package:money/presentation/transaction/controller/controller.dart';

class TopUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TopUpController());
  }
}

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController());
  }
}
