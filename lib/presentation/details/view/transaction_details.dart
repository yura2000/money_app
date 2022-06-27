import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/constants/app_icons.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/dimension.dart';
import 'package:money/presentation/transaction/controller/controller.dart';
import 'package:money/presentation/transaction/model/transaction_model.dart';

bool switchValue = false;

class TransactionDetailsPage extends StatefulWidget {
  const TransactionDetailsPage({Key? key}) : super(key: key);

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  @override
  Widget build(BuildContext context) {
    onSwitchValueChanged(newValue) {
      setState(() {
        switchValue = newValue;
      });
    }

    final Transaction transaction = Get.arguments;
    final first = transaction.amount.split('.').first;
    final remainder = transaction.amount.split('.').last;

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: AppColors.purple,
              child: SizedBox(
                height: 44 + MediaQuery.of(context).padding.top,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: largeSpace,
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Stack(
                    children: [
                      const Center(
                        child: Text(
                          'MoneyApp',
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.38,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        left: largeSpace,
                        top: mediumSpace,
                        child: IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          splashRadius: doubleMediumSpace,
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: doubleLightSpace,
                left: doubleLightSpace,
                right: doubleMediumSpace,
              ),
              child: Row(
                children: [
                  Container(
                    height: lightSpace * lightSpace,
                    width: lightSpace * lightSpace,
                    decoration: const BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: const Icon(
                      AppIcons.pay,
                      color: AppColors.white,
                      size: 35,
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: first,
                      style: const TextStyle(
                          fontSize: 37,
                          fontWeight: FontWeight.w300,
                          color: AppColors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: '.$remainder',
                          style: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: doubleLightSpace,
                right: doubleMediumSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.name,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      height: 1.57,
                    ),
                  ),
                  Text(
                    transaction.createdAt.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: doubleLargeSpace * 2),
            WhiteButtons(
              icon: AppIcons.receipt,
              name: 'Add receipt',
              onPressed: () {},
            ),
            transaction.type == TransactionType.topUp
                ? const SizedBox.shrink()
                : const Padding(
                    padding: EdgeInsets.only(
                      top: lightSpace * 7,
                      left: doubleLightSpace,
                    ),
                    child: Text(
                      'SHARE THE COST',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.hower,
                        height: 1.57,
                      ),
                    ),
                  ),
            transaction.type == TransactionType.topUp
                ? const SizedBox.shrink()
                : WhiteButtons(
                    icon: AppIcons.split,
                    name: 'Split this bill',
                    onPressed: () {
                      Get.find<TransactionController>()
                          .splitTheCost(transaction);
                      Get.back();
                    },
                  ),
            transaction.type == TransactionType.topUp
                ? const SizedBox.shrink()
                : const Padding(
                    padding: EdgeInsets.only(
                      top: mediumSpace * 3,
                      left: doubleLightSpace,
                    ),
                    child: Text(
                      'SUBSCRIPTION',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.hower,
                        height: 1.57,
                      ),
                    ),
                  ),
            transaction.type == TransactionType.topUp
                ? const SizedBox.shrink()
                : Container(
                    height: mediumSpace * 5,
                    width: double.infinity,
                    color: AppColors.white,
                    padding: const EdgeInsets.only(
                      top: halfMediumSpace * 3,
                      bottom: halfMediumSpace * 3,
                      left: halfMediumSpace * 5,
                      right: largeSpace,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Repeating payment',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                              height: 1.57,
                            ),
                          ),
                        ),
                        Switch(
                          activeColor: AppColors.purple,
                          value: switchValue,
                          onChanged: (newValue) {
                            if (newValue) {
                              Get.find<TransactionController>()
                                  .addSubscription(transaction);
                              Get.back();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: lightSpace * 7),
            Material(
              color: AppColors.white,
              child: InkWell(
                onTap: () => showDialog(
                  context: context,
                  builder: (_) => Dialog(),
                  barrierDismissible: false,
                ),
                child: Container(
                  height: mediumSpace * 5,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: halfMediumSpace * 3,
                    bottom: halfMediumSpace * 3,
                    left: halfMediumSpace * 5,
                    right: halfMediumSpace,
                  ),
                  child: const Text(
                    'Something wrong? Get help',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.red,
                      height: 1.57,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: mediumSpace * 9.5,
                left: mediumSpace * 9.5,
                top: doubleLargeSpace * 2,
                bottom: doubleLargeSpace,
              ),
              child: Center(
                child: Text(
                  'Transaction ID #1223SD23RWDF2DFAS eBay - Merchant ID #1245',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Help is on the way, stay put!'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Thanks!'),
        ),
      ],
    );
  }
}

class WhiteButtons extends StatelessWidget {
  final String name;
  final void Function()? onPressed;
  final IconData? icon;

  const WhiteButtons({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: onPressed,
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
                  size: 15,
                ),
              ),
              const SizedBox(width: lightSpace),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  height: 1.57,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
