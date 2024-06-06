import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color primary50 = Color(0xFFFAF5FF);
  static const Color primary100 = Color(0xFFF3E8FF);
  static const Color primary200 = Color(0xFFEAD4FF);
  static const Color primary300 = Color(0xFFD9B3FF);
  static const Color primary400 = Color(0xFFC282FE);
  static const Color primary500 = Color(0xFFAB53F9);
  static const Color primary600 = Color(0xFF9731EC);
  static const Color primary700 = Color(0xFF8120D0);
  static const Color primary800 = Color(0xFF6E1FAA);
  static const Color primary900 = Color(0xFF5A1B88);
  static const Color primary950 = Color(0xFF3D0665);
}

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColor.primary400,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    colorScheme: ColorScheme(
      primary: AppColor.primary400,
      primaryVariant: AppColor.primary600,
      secondary: AppColor.primary400,
      secondaryVariant: AppColor.primary600,
      surface: Colors.white,
      background: Colors.black,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
  );  
}