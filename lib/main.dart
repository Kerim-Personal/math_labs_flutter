import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:math_labs_flutter/providers/locale_provider.dart';
import 'package:math_labs_flutter/providers/theme_provider.dart';
import 'package:math_labs_flutter/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  // Enable asynchronous operations before app initialization
  WidgetsFlutterBinding.ensureInitialized();

  // Load API key from .env file
  await dotenv.load(fileName: ".env");

  // Initialize the app with multiple providers
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
    // Listen to changes in theme and locale providers
    final themeProvider = context.watch<ThemeProvider>();
    final localeProvider = context.watch<LocaleProvider>();

    return MaterialApp(
      title: 'Math Labs',
      debugShowCheckedModeBanner: false,
      // Localization support
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: localeProvider.locale, // Dynamically set locale from provider
      // Theme management
      theme: themeProvider.getThemeData(),      // Light theme
      darkTheme: themeProvider.getDarkThemeData(), // Dark theme
      themeMode: themeProvider.themeMode,      // Theme mode selection
      // Initial screen
      home: const SplashScreen(),
    );
  }
}