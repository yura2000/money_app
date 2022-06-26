import 'package:flutter/material.dart';
import 'package:money/constants/buttons.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/dimension.dart';

String integer = '';
String remainder = '';

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
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
              "How much?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: mediumSpace * 6),
            RichText(
              textAlign: TextAlign.center,
              maxLines: 2,
              text: TextSpan(
                text: '£',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                    text: integer,
                    style: const TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: remainder,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: mediumSpace * 21,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2.5,
                  crossAxisCount: 3,
                ),
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  if (index == buttons.length - 1) {
                    return ButtonTheme(
                      minWidth: mediumSpace * 11,
                      height: doubleMediumSpace * 3,
                      child: TextButton(
                        onPressed: () {
                          setState(
                            () {
                              if (remainder.isEmpty) {
                                integer =
                                    integer.substring(0, integer.length - 1);
                              } else {
                                remainder = remainder.substring(
                                    0, remainder.length - 1);
                              }
                            },
                          );
                        },
                        child: Text(
                          buttons[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  } else if (index == buttons.length - 3) {
                    return ButtonTheme(
                      minWidth: mediumSpace * 11,
                      height: doubleMediumSpace * 3,
                      child: TextButton(
                        onPressed: () {
                          setState(
                            () {
                              if (remainder.isEmpty) {
                                remainder += buttons[index];
                              }
                            },
                          );
                        },
                        child: Text(
                          buttons[index],
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
                        onPressed: () {
                          setState(
                            () {
                              if (integer.isEmpty && buttons[index] == '0') {
                              } else if (remainder.isEmpty) {
                                integer += buttons[index];
                              }
                              if (remainder.isNotEmpty &&
                                  remainder.length < 3) {
                                remainder += buttons[index];
                              }
                            },
                          );
                        },
                        child: Text(
                          buttons[index],
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
