import 'package:flutter/material.dart';
import 'package:task_app/app/core/theme/colors.dart';

class Themes {
  static final light = ThemeData(
    fontFamily: "Lexend Deca",
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.textWhiteColor,
    primaryColor: Colors.white,
    primaryColorDark: Colors.black,
    // cardColor: const Color(0xFFFFFFFF),
    // splashColor: const Color(0xFFACDFF4),
    // dividerColor: const Color(0x61000000),
    // colorScheme: const ColorScheme.light(),
    // textSelectionTheme: const TextSelectionThemeData(
    //   selectionColor: Color(0xFF2BACE2),
    //   cursorColor: Color(0xFF2BACE2),
    //   selectionHandleColor: Color(0xFF2BACE2)),
    // backgroundColor: Colors.white,
    // buttonColor: Colors.cyan,
    // bottomAppBarColor: Colors.cyan,
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Colors.cyan,
    //   textTheme: ButtonTextTheme.primary,
    // ),
  );

  static final dark = ThemeData(
    fontFamily: "Lexend Deca",
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBgColor,
    primaryColor: AppColors.darkBgColor,
    primaryColorDark: AppColors.darkBgColor,
    // cardColor: const Color(0xFF1F1F30),
    // splashColor: const Color(0xFFACDFF4),
    // dividerColor: const Color(0xFF9B97B6),
    // colorScheme: const ColorScheme.dark(),
    // backgroundColor: Colors.black,
    // buttonColor: Colors.deepPurple,
    // bottomAppBarColor: Colors.deepPurple,
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: Colors.deepPurple,
    //   textTheme: ButtonTextTheme.primary,
    // ),
  );
}
