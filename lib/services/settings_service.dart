import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  // Ayarları saklamak için kullanacağımız anahtarlar (keys)
  static const String _usernameKey = 'user_name';
  static const String _themeModeKey = 'theme_mode';
  static const String _colorThemeKey = 'color_theme';
  static const String _languageKey = 'language_code';

  // Kullanıcı Adını Kaydetme ve Okuma
  Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }

  // Tema Modunu (Açık/Karanlık/Sistem) Kaydetme ve Okuma
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeModeKey, themeMode.index);
  }

  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_themeModeKey);
    // Kayıtlı bir değer yoksa, sistem varsayılanını kullan
    if (index == null) return ThemeMode.system;
    return ThemeMode.values[index];
  }

  // Renk Temasını Kaydetme ve Okuma
  // Renk temasını bir string olarak saklayacağız (örn: "sereneBlue", "red")
  Future<void> saveColorTheme(String themeName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_colorThemeKey, themeName);
  }

  Future<String> getColorTheme() async {
    final prefs = await SharedPreferences.getInstance();
    // Kayıtlı bir renk yoksa, varsayılan olarak 'sereneBlue' dönsün
    return prefs.getString(_colorThemeKey) ?? 'sereneBlue';
  }

  // Dil Kodunu (tr/en) Kaydetme ve Okuma
  Future<void> saveLanguage(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, code);
  }

  Future<String?> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey);
  }
}