import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ceticy/core/style/app_theme.dart';

/// Available theme modes in the application
enum AppThemeMode { light, dark, system }

/// Provider managing the application theme
class ThemeProvider with ChangeNotifier {
  static const String _themePreferenceKey = 'themeMode';

  AppThemeMode _themeMode = AppThemeMode.system;
  SharedPreferences? _prefs;

  ThemeProvider() {
    loadThemeFromPreferences();
  }

  /// Returns the current theme mode
  AppThemeMode get themeMode => _themeMode;

  /// Returns the current theme based on the selected mode
  ThemeData get currentTheme => _getThemeForMode(_themeMode);

  /// Returns the theme corresponding to the specified mode
  ThemeData _getThemeForMode(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.light:
        return AppTheme.lightTheme;
      case AppThemeMode.dark:
        return AppTheme.darkTheme;
      case AppThemeMode.system:
        return _isSystemDarkMode() ? AppTheme.darkTheme : AppTheme.lightTheme;
    }
  }

  /// Checks if system dark mode is enabled
  bool _isSystemDarkMode() {
    return WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
  }

  /// Updates the status bar style based on the current theme
  void _updateStatusBar() {
    final isDarkMode = _themeMode == AppThemeMode.dark || 
        (_themeMode == AppThemeMode.system && _isSystemDarkMode());

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
    ));
  }

  /// Loads the saved theme from SharedPreferences
  Future<void> loadThemeFromPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
    final savedTheme = _prefs!.getString(_themePreferenceKey) ?? AppThemeMode.system.name;
    _themeMode = AppThemeMode.values.firstWhere(
      (mode) => mode.name == savedTheme,
      orElse: () => AppThemeMode.system,
    );
    _updateStatusBar();
    notifyListeners();
  }

  /// Changes the theme and saves the preference
  Future<void> updateTheme(AppThemeMode themeMode) async {
    if (_themeMode == themeMode) return;

    _themeMode = themeMode;
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setString(_themePreferenceKey, themeMode.name);
    _updateStatusBar();
    notifyListeners();
  }
}
