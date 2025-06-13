import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pdf/screens/main_screen.dart';
import 'package:pdf/screens/name_entry_screen.dart';
import 'package:pdf/services/settings_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SettingsService _settingsService = SettingsService();

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    // 2.5 saniye sonra yönlendirme yap
    Timer(const Duration(milliseconds: 2500), _navigate);
  }

  void _navigate() async {
    // Kayıtlı kullanıcı adını kontrol et
    final username = await _settingsService.getUsername();

    if (mounted) { // Widget'ın hala ekranda olduğundan emin ol
      if (username == null || username.isEmpty) {
        // Kullanıcı adı yoksa, isim giriş ekranına git
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NameEntryScreen()),
        );
      } else {
        // Kullanıcı adı varsa, ana ekrana git
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Orijinal tasarıma benzer bir görünüm
    return const Scaffold(
      backgroundColor: Color(0xFF1A5A7A), // serene_blue_dark
      body: Center(
        child: Text(
          "Codenzi",
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE2E2E6), // serene_text_light
          ),
        ),
      ),
    );
  }
}