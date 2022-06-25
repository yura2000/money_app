import 'package:flutter/material.dart';
import 'package:money/constants/colors.dart';
import 'package:money/constants/dimension.dart';

class AppButton {
  static ElevatedButton mainButton({
    required String title,
    required void Function()? onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(doubleMediumSpace * 10, doubleMediumSpace * 3),
        primary: AppColors.buttonColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
