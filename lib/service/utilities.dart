import 'package:flutter/material.dart';
import 'package:flutter_learn/themes/app_colors.dart';

RegExp emailReg = RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$');

const TextStyle font_16_500Black = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black);
