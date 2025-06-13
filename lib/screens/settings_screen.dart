import 'package:flutter/material.dart';
import 'package:math_labs_flutter/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Değişiklik yapmak için provider'a "listen: false" ile erişiyoruz.
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar", style: TextStyle(color: theme.colorScheme.onPrimary)),
        backgroundColor: theme.colorScheme.primary,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text("Görünüm", style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
          // Tema Modu Seçimi (Açık, Karanlık, Sistem)
          DropdownButton<ThemeMode>(
            value: context.watch<ThemeProvider>().themeMode, // Değişikliği dinlemek için "watch"
            isExpanded: true,
            items: const [
              DropdownMenuItem(value: ThemeMode.system, child: Text("Sistem Varsayılanı")),
              DropdownMenuItem(value: ThemeMode.light, child: Text("Açık Tema")),
              DropdownMenuItem(value: ThemeMode.dark, child: Text("Karanlık Tema")),
            ],
            onChanged: (value) {
              if (value != null) {
                themeProvider.setThemeMode(value);
              }
            },
          ),
          const SizedBox(height: 20),
          // Renk Teması Seçimi
          Text("Uygulama Rengi", style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            value: context.watch<ThemeProvider>().colorThemeName,
            isExpanded: true,
            items: const [
              DropdownMenuItem(value: "sereneBlue", child: Text("Sakin Mavi")),
              DropdownMenuItem(value: "red", child: Text("Kırmızı")),
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