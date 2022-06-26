import 'package:flutter/material.dart';
import 'package:money/constants/buttons.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/dimension.dart';

class ToWhomPage extends StatefulWidget {
  const ToWhomPage({Key? key}) : super(key: key);

  @override
  State<ToWhomPage> createState() => _ToWhomPageState();
}

class _ToWhomPageState extends State<ToWhomPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

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
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    right: largeSpace,
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
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
              "To whom?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: doubleMediumSpace * 5),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: doubleLargeSpace * 2),
              child: SizedBox(
                height: doubleMediumSpace * 2,
                child: TextField(
                  maxLength: 25,
                  controller: myController,
                  textAlign: TextAlign.center,
                  cursorColor: AppColors.white,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: lightSpace / 4,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: lightSpace / 4,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.white,
                        width: lightSpace / 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            AppButton.mainButton(
              title: "Pay",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
