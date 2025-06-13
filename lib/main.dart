import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pdf/providers/locale_provider.dart';
import 'package:pdf/providers/theme_provider.dart';
import 'package:pdf/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  // Uygulama başlamadan önce yapılacak asenkron işlemleri etkinleştir
  WidgetsFlutterBinding.ensureInitialized();

  // .env dosyasındaki API anahtarını yükle
  await dotenv.load(fileName: ".env");

  // Uygulamayı birden fazla provider ile başlat
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Tema ve dil sağlayıcılarındaki değişiklikleri dinle
    final themeProvider = context.watch<ThemeProvider>();
    final localeProvider = context.watch<LocaleProvider>();

    return MaterialApp(
      title: 'Math Labs',
      debugShowCheckedModeBanner: false,

      // --- Dil Desteği (l10n) ---
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeProvider.locale, // Dili provider'dan dinamik olarak al

      // --- Tema Yönetimi ---
      theme: themeProvider.getThemeData(),      // Aydınlık tema
      darkTheme: themeProvider.getDarkThemeData(), // Karanlık tema
      themeMode: themeProvider.themeMode,      // Hangi modun kullanılacağı

      // --- Başlangıç Ekranı ---
      home: const SplashScreen(),
    );
  }
}