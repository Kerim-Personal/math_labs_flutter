import 'package:flutter/material.dart';
import 'package:math_labs_flutter/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Değişiklik yapmak için provider'a "listen: false" ile erişiyoruz.
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.settings, style: TextStyle(color: theme.colorScheme.onPrimary)),
        backgroundColor: theme.colorScheme.primary,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(localizations.view_settings, style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
          // Tema Modu Seçimi (Açık, Karanlık, Sistem)
          DropdownButton<ThemeMode>(
            value: context.watch<ThemeProvider>().themeMode, // Değişikliği dinlemek için "watch"
            isExpanded: true,
            items: [
              DropdownMenuItem(value: ThemeMode.system, child: Text(localizations.system_default)),
              DropdownMenuItem(value: ThemeMode.light, child: Text(localizations.light_theme)),
              DropdownMenuItem(value: ThemeMode.dark, child: Text(localizations.dark_theme)),
            ],
            onChanged: (value) {
              if (value != null) {
                themeProvider.setThemeMode(value);
              }
            },
          ),
          const SizedBox(height: 20),
          // Renk Teması Seçimi
          Text(localizations.app_color, style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            value: context.watch<ThemeProvider>().colorThemeName,
            isExpanded: true,
            items: [
              DropdownMenuItem(value: "sereneBlue", child: Text(localizations.serene_blue)),
              DropdownMenuItem(value: "red", child: Text(localizations.red)),
              // Diğer renkler buraya eklenebilir
            ],
            onChanged: (value) {
              if (value != null) {
                themeProvider.setColorTheme(value);
              }
            },
          ),
        ],
      ),
    );
  }
}