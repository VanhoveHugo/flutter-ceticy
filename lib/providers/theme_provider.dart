import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ceticy/core/style/app_theme.dart';

enum AppThemeMode { light, dark }

class ThemeProvider with ChangeNotifier {
  AppThemeMode _themeMode = AppThemeMode.light;

  AppThemeMode get themeMode => _themeMode;

  ThemeData get currentTheme {
    if (_themeMode == AppThemeMode.light) return AppTheme.lightTheme;
    if (_themeMode == AppThemeMode.dark) return AppTheme.darkTheme;
    return WidgetsBinding.instance.window.platformBrightness == Brightness.dark
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;
  }

  Future<void> loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('themeMode') ?? 'light';
    _themeMode = AppThemeMode.values.firstWhere(
      (mode) => mode.toString().split('.').last == savedTheme,
      orElse: () => AppThemeMode.light,
    );
    notifyListeners();
  }

  Future<void> updateTheme(AppThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', themeMode.toString().split('.').last);
  }
}
