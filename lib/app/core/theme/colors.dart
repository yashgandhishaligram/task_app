import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  static Color appPrimaryColor = const Color(0xFF624FFA);
  static Color appLogoColor = const Color(0xFFCFBEDE);
  static Color textColor = const Color(0xFF202635);
  static Color textWhiteColor = const Color(0xFFFFFFFF);
  static Color darkBgColor = const Color(0xFF202635);
  static Color textFieldTextColor = const Color(0xFF24252C);
  static Color titleTextColor = const Color(0xFF6E6A7C);
  static Color textFieldBGColor = const Color(0xFF242C42);
  static Color textRedColor = const Color(0xFFBC1006);
  static Gradient appBgColor = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFFFFFFF), Color(0xFFECECEC)]);
}