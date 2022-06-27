import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/bindings.dart';
import 'package:money/constants/navigation.dart';
import 'package:money/presentation/to_whom/view/to_whom.dart';
import 'package:money/presentation/top_up/view/top_up.dart';
import 'package:money/presentation/details/view/transaction_details.dart';
import 'package:money/presentation/transaction/view/transactions.dart';

void main() {
  runApp(const MoneyApp());
}

class MoneyApp extends StatelessWidget {
  const MoneyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MoneyApp',
      getPages: [
        GetPage(
          name: home,
          page: () => const TransactionsPage(),
          binding: TransactionBinding(),
        ),
        GetPage(
          name: topUp,
          page: () => TopUpPage(),
          binding: TopUpBinding(),
        ),
        GetPage(
          name: toWhom,
          page: () => const ToWhomPage(),
        ),
        GetPage(
          name: details,
          page: () => const TransactionDetailsPage(),
        ),
      ],
      initialRoute: home,
    );
  }
}
