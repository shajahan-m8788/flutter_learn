import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final void Function()? onPressed;
  const CustomButton({super.key, this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
          child: Text(
            label!,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
