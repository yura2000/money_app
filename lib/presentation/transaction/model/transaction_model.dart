import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money/constants/app_icons.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/dimension.dart';
import 'package:money/constants/navigation.dart';

enum TransactionType {
  pay,
  topUp,
}

class Transaction {
  final String id;
  final TransactionType type;
  final String name;
  final String amount;
  final String merchantId;
  DateTime createdAt;

  Transaction({
    required this.id,
    required this.type,
    required this.name,
    required this.amount,
    required this.createdAt,
    this.merchantId = '',
  });
}

Iterable<Widget> createFeedList(
  BuildContext context,
  List<Transaction> items,
) sync* {
  Transaction? previousItem;
  yield textRecentActivity();
  final sorted = items.sortedByDescending((item) => item.createdAt);
  for (var item in sorted) {
    if (previousItem?.createdAt.isAtSameDayAs(item.createdAt) != true) {
      if (item.createdAt.isAtSameDayAs(currentDate)) {
        yield dateActivity('TODAY');
      } else if (item.createdAt
          .isAtSameDayAs(currentDate.subtract(const Duration(days: 1)))) {
        yield dateActivity('YESTERDAY');
      } else {
        yield dateActivity(
            DateFormat('MM-dd-yyyy').format(item.createdAt).toString());
      }
    }
    previousItem = item;
    yield activity(item);
  }
}

Padding dateActivity(String day) {
  return Padding(
    padding: const EdgeInsets.only(left: doubleMediumSpace),
    child: Text(
      day,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 10,
        height: 2.2,
        color: AppColors.secondary,
      ),
    ),
  );
}

Padding textRecentActivity() {
  return const Padding(
    padding: EdgeInsets.only(
      left: doubleMediumSpace,
      bottom: lightSpace,
    ),
    child: Text(
      'Recent activity',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.hower,
        height: 1.57,
      ),
    ),
  );
}

Widget activity(Transaction item) {
  double priceDouble = double.parse(item.amount);
  int priceInteger = priceDouble.floor();
  String reminder =
      (double.parse((priceDouble - priceInteger).toStringAsFixed(2)))
          .toString();
  String priceString = '+$priceInteger';

  String lowerPrice = reminder.substring(1);
  if (lowerPrice.length == 2) {
    lowerPrice += '0';
  }

  IconData icon;
  Color textColor;
  String price = priceString;
  if (item.type == TransactionType.pay) {
    price = priceString.substring(1);
    textColor = AppColors.black;
    icon = AppIcons.pay;
  } else {
    textColor = AppColors.purple;
    icon = Icons.add_circle;
  }

  return Material(
    color: AppColors.white,
    child: InkWell(
      onTap: () => Get.toNamed(details, arguments: item),
      child: Container(
        height: mediumSpace * 5,
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: halfMediumSpace * 5,
          right: doubleMediumSpace,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: doubleMediumSpace,
              width: doubleMediumSpace,
              decoration: const BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Icon(
                icon,
                color: AppColors.white,
                size: 13,
              ),
            ),
            const SizedBox(width: lightSpace),
            Expanded(
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  height: 1.57,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: price,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: textColor),
                children: <TextSpan>[
                  TextSpan(
                    text: lowerPrice,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: textColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

DateTime currentDate = DateTime.now();
