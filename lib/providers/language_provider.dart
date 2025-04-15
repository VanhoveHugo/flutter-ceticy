import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'selected_language';
  late SharedPreferences _prefs;
  Locale _currentLocale = const Locale('fr', 'FR');

  final List<Map<String, dynamic>> languages = const [
    {'code': 'fr', 'country': 'FR', 'name': 'Français'},
    {'code': 'en', 'country': 'US', 'name': 'English'},
    {'code': 'de', 'country': 'DE', 'name': 'Deutsch'},
    {'code': 'es', 'country': 'ES', 'name': 'Español'},
  ];

  final List<Locale> supportedLocales = const [
    Locale('fr', 'FR'), // Français
    Locale('en', 'US'), // Anglais
    Locale('de', 'DE'), // Allemand
    Locale('es', 'ES'), // Espagnol
  ];

  Locale get currentLocale => _currentLocale;

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final String? savedLanguage = _prefs.getString(_languageKey);
    if (savedLanguage != null) {
      final languageData = languages.firstWhere(
        (lang) => lang['code'] == savedLanguage,
        orElse: () => languages.first,
      );
      _currentLocale = Locale(languageData['code'], languageData['country']);
      notifyListeners();
    }
  }

  Future<void> setLanguage(String languageCode) async {
    final languageData = languages.firstWhere(
      (lang) => lang['code'] == languageCode,
      orElse: () => languages.first,
    );
    _currentLocale = Locale(languageData['code'], languageData['country']);
    await _prefs.setString(_languageKey, languageCode);
    notifyListeners();
  }
} 