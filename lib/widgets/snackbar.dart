import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';

void showToast(
    {required BuildContext context,
    required Widget content,
    SnackType snackType = SnackType.success}) {
  Color getColor(snackType) {
    if (snackType == SnackType.error) {
      return AppColors.errorColor;
    } else if (snackType == SnackType.success) {
      return AppColors.primaryColor.withOpacity(0.4);
    } else {
      return AppColors.black;
    }
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: content,
    backgroundColor: getColor(snackType),
    duration: const Duration(seconds: 2),
  ));
}

enum SnackType { error, success, warning }
