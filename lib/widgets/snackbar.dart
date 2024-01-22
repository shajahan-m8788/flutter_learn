import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';

void showToast({required BuildContext context, required Widget content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: content,
    backgroundColor: AppColors.primaryColor.withOpacity(0.4),
    duration: const Duration(seconds: 2),
  ));
}
