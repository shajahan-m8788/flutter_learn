import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';

class CustomButton extends StatefulWidget {
  final String? label;
  final void Function()? onPressed;
  final bool isDisabled;
  const CustomButton(
      {super.key, this.label, this.onPressed, this.isDisabled = false});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  double opacityLevel = 1.0;
  void _changeOpacity() {
    setState(() => opacityLevel = 0.6);
  }

  onPress() {
    _changeOpacity();
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: const Duration(seconds: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            onPressed: widget.isDisabled == false ? onPress() : null,
            style: TextButton.styleFrom(
                backgroundColor: !widget.isDisabled
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withOpacity(0.2),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16)),
            child: Text(
              widget.label!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
