import 'package:flutter/material.dart';
import 'package:math_labs_flutter/data/course_data.dart';
import 'package:math_labs_flutter/models/course.dart';
import 'package:math_labs_flutter/screens/pdf_view_screen.dart';
import 'package:math_labs_flutter/screens/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Course> _courses;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _courses = getCourseList(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.main_title, style: TextStyle(color: theme.colorScheme.onPrimary)),
        backgroundColor: theme.colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: theme.colorScheme.onPrimary),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _courses.length,
        itemBuilder: (context, index) {
          final course = _courses[index];
          return ExpansionTile(
            title: Text(course.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            children: course.topics.map((topic) {
              return ListTile(
                title: Text(topic),
                onTap: () {
                  final pdfPath = course.topicPdfPaths[topic];
                  if (pdfPath != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PdfViewScreen(
                          pdfPath: pdfPath,
                          title: topic,
                        ),
                      ),
                    );
                  }
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}