import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';
import 'package:flutter_learn/widgets/custom_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "404",
                style: GoogleFonts.sourceCodePro(
                    fontSize: 60,
                    color: AppColors.errorColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Page not Found",
                style: GoogleFonts.sourceCodePro(
                    fontSize: 30,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
    );
  }
}
