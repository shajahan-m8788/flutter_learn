import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry bodyPadding;
  final Color bgColor;
  const CustomScaffold(
      {super.key,
      this.body,
      this.appBar,
      this.bodyPadding =
          const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
      this.bgColor = AppColors.scaffoldBg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(padding: bodyPadding, child: body),
      appBar: appBar,
    );
  }
}
