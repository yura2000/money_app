import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/constants/app_icons.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/dimension.dart';
import 'package:money/constants/navigation.dart';
import 'package:money/presentation/transaction/model/transaction_model.dart';
import 'package:time/time.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).padding.top + 250,
                width: double.infinity,
                color: AppColors.purple,
                child: Column(
                  children: [
                    const Text(
                      'MoneyApp',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.38,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 60),
                    RichText(
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      text: const TextSpan(
                        text: '£',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                          TextSpan(
                            text: "150",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '.25',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.grey,
                  child: ListView(
                    children: createFeedList(context, transaction).toList(),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 200,
            left: 15,
            right: 15,
            child: SizedBox(
              height: 100,
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Get.toNamed(topUp, arguments: true),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/phone_icon.png'),
                            const Text(
                              'Pay',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                height: 1.83,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 45),
                      TextButton(
                        onPressed: () => Get.toNamed(topUp, arguments: false),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/wallet_icon.png'),
                            const Text(
                              'Top up',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                                height: 1.83,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Iterable<Widget> createFeedList(
  BuildContext context,
  List<Transaction> items,
) sync* {
  Transaction? previousItem;
  for (final item in items) {
    if (previousItem?.createdAt.isAtSameDayAs(item.createdAt) == true) {
      yield Container(
        color: AppColors.purple,
        height: halfLightSpace,
      );
    }
    yield newMethod(item);
  }
}

Material newMethod(Transaction item) {
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
    icon = Icons.plus_one_outlined;
  }

  return Material(
    color: AppColors.white,
    child: InkWell(
      onTap: () {},
      child: Container(
        height: mediumSpace * 5,
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: halfMediumSpace * 3,
          bottom: halfMediumSpace * 3,
          left: halfMediumSpace * 5,
          right: halfMediumSpace * 5,
        ),
        child: Row(
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
