import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color primary50 = const Color(0xFFFAF5FF);
  static const Color primary100 = const Color(0xFFF3E8FF);
  static const Color primary200 = const Color(0xFFEAD4FF);
  static const Color primary300 = const Color(0xFFD9B3FF);
  static const Color primary400 = const Color(0xFFC282FE);
  static const Color primary500 = const Color(0xFFAB53F9);
  static const Color primary600 = const Color(0xFF9731EC);
  static const Color primary700 = const Color(0xFF8120D0);
  static const Color primary800 = const Color(0xFF6E1FAA);
  static const Color primary900 = const Color(0xFF5A1B88);
  static const Color primary950 = const Color(0xFF3D0665);
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
      secondary: AppColor.primary600,
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