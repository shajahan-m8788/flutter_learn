import 'package:flutter/material.dart';
import 'package:flutter_learn/constants/constatnt.dart';
import 'package:flutter_learn/themes/app_colors.dart';
import 'package:flutter_learn/themes/app_colors_swatch.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Nunito',
    useMaterial3: false,
    primarySwatch: Palette.kToDark,
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.defaultBorderColor),
          borderRadius: BorderRadius.all(AppConstants.defaultBorderRadius)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor),
          borderRadius: BorderRadius.all(AppConstants.defaultBorderRadius)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.all(AppConstants.defaultBorderRadius)),
    ),
  );
}
