//palette.dart
import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xffd40ceb, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffd824ed), //10%
      100: Color(0xffdd3def), //20%
      200: Color(0xffe155f1), //30%
      300: Color(0xffe56df3), //40%
      400: Color(0xffea86f5), //50%
      500: Color(0xffee9ef7), //60%
      600: Color(0xfff2b6f9), //70%
      700: Color(0xfff6cefb), //80%
      800: Color(0xfffbe7fd), //90%
      900: Color(0xffffffff), //100%
    },
  );
}
