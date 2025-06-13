import 'package:flutter/material.dart';
import 'package:pdf/screens/main_screen.dart';
import 'package:pdf/services/settings_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NameEntryScreen extends StatefulWidget {
  const NameEntryScreen({super.key});

  @override
  State<NameEntryScreen> createState() => _NameEntryScreenState();
}

class _NameEntryScreenState extends State<NameEntryScreen> {
  final _nameController = TextEditingController();
  final _settingsService = SettingsService();

  @override
  void dispose() {
    // Controller'ı temizleyerek memory leak (hafıza sızıntısı) önlüyoruz.
    _nameController.dispose();
    super.dispose();
  }

  void _continue() async {
    final name = _nameController.text.trim();
    if (name.isNotEmpty) {
      // İsmi kaydet
      await _settingsService.saveUsername(name);

      // Ana Ekrana yönlendir ve bu ekranı yığından (stack) kaldır
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    } else {
      // İsim boşsa kullanıcıyı uyar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.enter_valid_name_toast),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Temadan renkleri alarak dinamik bir UI oluşturuyoruz.
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignmente: MainAxisAlignment.center,
            children: [
              Text(
                localizations.name_prompt,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: localizations.name_hint,
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _continue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text(localizations.continue_button),
              ),
            ],
          ),
        ),
      ),
    );
  }
}