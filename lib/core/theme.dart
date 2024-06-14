import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color primary50 = Color(0xFFFFFAEC);
  static const Color primary100 = Color(0xFFFFF4D3);
  static const Color primary200 = Color(0xFFFFE6A5);
  static const Color primary300 = Color(0xFFFFD26D);
  static const Color primary400 = Color(0xFFFFB332);
  static const Color primary500 = Color(0xFFFF9A0A);
  static const Color primary600 = Color(0xFFFF8200);
  static const Color primary700 = Color(0xFFCC5F02);
  static const Color primary800 = Color(0xFFA1490B);
  static const Color primary900 = Color(0xFF823E0C);
  static const Color primary950 = Color(0xFF461D04);

  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF4F4F5);
  static const Color grey200 = Color(0xFFE4E4E7);
  static const Color grey300 = Color(0xFFD4D4D8);
  static const Color grey400 = Color(0xFFA1A1AA);
  static const Color grey500 = Color(0xFF71717A);
  static const Color grey600 = Color(0xFF52525B);
  static const Color grey700 = Color(0xFF3F3F46);
  static const Color grey800 = Color(0xFF27272A);
  static const Color grey900 = Color(0xFF18181B);
}

class AppTheme {
  AppTheme._();

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColor.primary400,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: const ColorScheme(
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: AppColor.primary400,
      unselectedItemColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColor.primary400),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
  );
}
