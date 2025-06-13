import 'package:flutter/material.dart';
import 'package:pdf/services/settings_service.dart';

class LocaleProvider with ChangeNotifier {
  final SettingsService _settingsService = SettingsService();
  Locale? _locale;

  Locale? get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  void _loadLocale() async {
    final languageCode = await _settingsService.getLanguage();
    if (languageCode != null) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }

  void setLocale(String languageCode) async {
    await _settingsService.saveLanguage(languageCode);
    _locale = Locale(languageCode);
    notifyListeners();
  }
}