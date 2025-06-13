import 'package:flutter/material.dart';
import 'package:math_labs_flutter/models/course.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Konu başlığını "kalkulus_limit_ve_sureklilik" gibi bir formata çevirir.
String _normalize(String input) {
  return input
      .toLowerCase()
      .replaceAll('ş', 's')
      .replaceAll('ç', 'c')
      .replaceAll('ğ', 'g')
      .replaceAll('ı', 'i')
      .replaceAll('ö', 'o')
      .replaceAll('ü', 'u')
      .replaceAll(' ', '_');
}

List<Course> getCourseList(BuildContext context) {
  final localizations = AppLocalizations.of(context)!;

  // Ders ve konu başlıklarını yerelleştirme dosyalarından alıyoruz.
  final String calculusCourse = localizations.course_calculus;
  final String limitTopic = localizations.topic_calculus_limit;

  final courses = [
    Course(
      title: calculusCourse,
      topics: [
        limitTopic,
      ],
      // PDF yollarını otomatik olarak oluşturuyoruz.
      topicPdfPaths: {
        limitTopic: 'assets/pdfs/${_normalize(calculusCourse)}_${_normalize(limitTopic)}.pdf',
        // Örnek: 'assets/pdfs/kalkulus_limit_ve_sureklilik.pdf'
      },
    ),
    // Diğer dersler ve konular buraya eklenebilir.
  ];

  return courses;
}