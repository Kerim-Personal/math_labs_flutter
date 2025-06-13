import 'package:flutter/material.dart';

class AppThemes {
  // Orijinal projedeki ana tema: Sakin Mavi
  static final ThemeData sereneBlueLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF2A78A0),
      onPrimary: Color(0xFFE2E2E6),
      secondary: Color(0xFF68A2A8),
      onSecondary: Color(0xFF1A1C1E),
      background: Color(0xFFFAFAFA),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1A1C1E),
    ),
  );

  static final ThemeData sereneBlueDark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF2A78A0),
      onPrimary: Color(0xFFE2E2E6),
      secondary: Color(0xFF68A2A8),
      onSecondary: Color(0xFF1A1C1E),
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFE2E2E6),
    ),
  );

  // Örnek olarak Kırmızı tema
  static final ThemeData redLight = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFF44336),
      onPrimary: Colors.white,
      secondary: Color(0xFFD32F2F),
      background: Color(0xFFFAFAFA),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1A1C1E),
    ),
  );

  static final ThemeData redDark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFF44336),
      onPrimary: Colors.white,
      secondary: Color(0xFFD32F2F),
      background: Color(0xFF121212),
      surface: Color(0xFF1E1E1E),
      onSurface: Color(0xFFE2E2E6),
    ),
  );

// Diğer renk temaları (Yeşil, Mor vb.) buraya eklenebilir.
}