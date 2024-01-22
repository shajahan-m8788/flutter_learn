import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';

class CustomLinkButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonText;
  const CustomLinkButton({super.key, this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Text(
          buttonText,
          style: const TextStyle(color: AppColors.linkColor),
        ));
  }
}
