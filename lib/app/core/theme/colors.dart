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
  static Color textRedColor2 = const Color(0xFFFF3B30);
  static Color textTitleColor = const Color(0xFF384156);
  static Color iconBgColor = const Color(0xFFEBF2FF);
  static Color imageBorderColor = const Color(0xFFC4C4C4);
  static Color textHighlightColor = const Color(0xFF919191);
  static Color wishTextColor = const Color(0xFF474747);
  static Color appBarBGColor = const Color(0xFFF1F2F3);
  static Color iconBorderColor = const Color(0xFF2C3346);
  static Color toggleGreenColor = const Color(0xFF1DC054);
  static Color toggleDarkBGColor = const Color(0xFF09101F);
  static Color toggleLightBGColor = const Color(0xFFDEE0E1);
  static Color dividerLightColor = const Color(0xFFC4C4C4);
  static Color dividerDarkColor = const Color(0xFF6C6F7E);
  static Color redPriorityColor = const Color(0xFFE96161);
  static Color greenPriorityColor = const Color(0xFF61E98F).withOpacity(0.10);
 // static Color appBarBGColor2 = const Color(0xFFF1F2F3);
  static Gradient appBgColor = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFFFFFFF), Color(0xFFECECEC)]);
  static Gradient appBgColor2 = const LinearGradient(
      colors: [Color(0xFFFFFFFF), Color(0xFFF6F5F5)]);
  static Gradient appBgColor3 = const LinearGradient(
      colors: [Color(0xFFF1F2F3), Color(0xFFEBF1F6)]);
  static Gradient appBgDarkColor = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF080F1E), Color(0xFF2C3346)]);
  static Gradient cardBgDarkColor =  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF202635).withOpacity(0.5), Color(0xFF202635).withOpacity(0.5)]);
  static Gradient cardBgLightColor = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFF2ECEC), Color(0xFFF9F9F9)]);
}