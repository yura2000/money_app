import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/navigation.dart';
import 'package:money/presentation/transaction/model/transaction_model.dart';

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
