import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money/constants/buttons.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/dimension.dart';
import 'package:money/constants/navigation.dart';
import 'package:money/presentation/top_up/controller/controller.dart';
import 'package:money/presentation/transaction/controller/controller.dart';

class TopUpPage extends StatelessWidget {
  TopUpPage({Key? key}) : super(key: key);

  final controller = Get.find<TopUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: doubleLightSpace * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: largeSpace),
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
                    right: largeSpace,
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: mediumSpace * 9),
            const Text(
              "How much?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: mediumSpace * 6),
            Obx(
              () => RichText(
                textAlign: TextAlign.center,
                maxLines: 2,
                text: TextSpan(
                  text: '£',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${controller.integer}',
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '${controller.remainder}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: mediumSpace * 21,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: controller.buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2.5,
                  crossAxisCount: 3,
                ),
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  if (index == controller.buttons.length - 1) {
                    return ButtonTheme(
                      minWidth: mediumSpace * 11,
                      height: doubleMediumSpace * 3,
                      child: TextButton(
                        onPressed: () => controller.calculate(index),
                        child: Text(
                          controller.buttons[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  } else if (index == controller.buttons.length - 3) {
                    return ButtonTheme(
                      minWidth: mediumSpace * 11,
                      height: doubleMediumSpace * 3,
                      child: TextButton(
                        onPressed: () => controller.calculate(index),
                        child: Text(
                          controller.buttons[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return ButtonTheme(
                      minWidth: mediumSpace * 11,
                      height: doubleMediumSpace * 3,
                      child: TextButton(
                        onPressed: () => controller.calculate(index),
                        child: Text(
                          controller.buttons[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const Spacer(),
            AppButton.mainButton(
              title: "Next",
              onPressed: () {
                if (Get.arguments) {
                  Get.toNamed(toWhom,
                      arguments:
                          '${controller.integer.value}${controller.remainder.value}');
                } else {
                  final transactionController =
                      Get.find<TransactionController>();
                  transactionController.addTopUpTransaction(
                      '${controller.integer.value}${controller.remainder.value}');
                  Get.back();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
