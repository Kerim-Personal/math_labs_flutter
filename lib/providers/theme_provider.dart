import 'package:flutter/material.dart';
import 'package:pdf/services/settings_service.dart';
import 'package:pdf/styles/themes.dart';

class ThemeProvider with ChangeNotifier {
  final SettingsService _settingsService = SettingsService();

  late ThemeMode _themeMode;
  late String _colorThemeName;

  ThemeMode get themeMode => _themeMode;
  String get colorThemeName => _colorThemeName;

  ThemeProvider() {
    _themeMode = ThemeMode.system; // Başlangıç varsayılanı
    _colorThemeName = 'sereneBlue'; // Başlangıç varsayılanı
    loadSettings();
  }

  // Ayarları cihaz hafızasından yükle
  void loadSettings() async {
    _themeMode = await _settingsService.getThemeMode();
    _colorThemeName = await _settingsService.getColorTheme();
    notifyListeners();
  }

  // Tema modunu güncelle ve kaydet
  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await _settingsService.saveThemeMode(mode);
    notifyListeners();
  }

  // Renk temasını güncelle ve kaydet
  void setColorTheme(String themeName) async {
    _colorThemeName = themeName;
    await _settingsService.saveColorTheme(themeName);
    notifyListeners();
  }

  // Mevcut ayarlara göre doğru ThemeData'yı döndür
  ThemeData getThemeData() {
    // Seçilen renk temasına ve aydınlık/karanlık moda göre doğru temayı döndürür.
    // Bu mantığı daha da geliştireceğiz ama şimdilik temel bir yapı kuruyoruz.
    switch (_colorThemeName) {
      case 'red':
        return AppThemes.redLight;
      case 'sereneBlue':
      default:
        return AppThemes.sereneBlueLight;
    }
  }

  ThemeData getDarkThemeData() {
    switch (_colorThemeName) {
      case 'red':
        return AppThemes.redDark;
      case 'sereneBlue':
      default:
        return AppThemes.sereneBlueDark;
    }
  }
}