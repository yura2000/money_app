import 'package:get/state_manager.dart';

class TopUpController extends GetxController {
  RxString integer = ''.obs;
  RxString remainder = ''.obs;

  final List<String> buttons = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    ".",
    "0",
    "<",
  ];

  void calculate(int index) {
    if (index == buttons.length - 1) {
      if (remainder.value.isEmpty) {
        integer.value = integer.value.substring(0, integer.value.length - 1);
      } else {
        remainder.value =
            remainder.value.substring(0, remainder.value.length - 1);
      }
    } else if (index == buttons.length - 3) {
      if (remainder.value.isEmpty) {
        remainder.value = '${remainder.value}${buttons[index]}';
      }
      if (integer.value.isEmpty) {
        integer.value = '${integer.value}0';
        remainder.value = buttons[index];
      }
    } else {
      if (remainder.value.isNotEmpty && remainder.value.length < 3) {
        remainder.value = '${remainder.value}${buttons[index]}';
      }
      if (integer.value.isEmpty && buttons[index] == '0') {
        integer.value = '${integer.value}${buttons[index]}';
        remainder.value = '.';
      } else if (remainder.isEmpty) {
        integer.value = '${integer.value}${buttons[index]}';
      }
    }
  }
}
