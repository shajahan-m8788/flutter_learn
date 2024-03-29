import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool secure;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      this.controller,
      this.label,
      this.hintText,
      this.secure = false,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  label!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.black),
                ))
            : const SizedBox(),
        TextFormField(
          obscureText: secure,
          decoration: InputDecoration(hintText: hintText),
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
