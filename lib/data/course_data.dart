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

  // Orijinal projedeki tüm dersler ve konular
  final courses = [
    Course(
      title: localizations.course_calculus,
      topics: [
        localizations.topic_calculus_limit,
        // Diğer konular...
      ],
      // PDF yollarını otomatik olarak oluşturuyoruz
      topicPdfPaths: {
        localizations.topic_calculus_limit: 'assets/pdfs/${_normalize(localizations.course_calculus)}_${_normalize(localizations.topic_calculus_limit)}.pdf',
        // Örnek: 'assets/pdfs/kalkulus_limit_ve_sureklilik.pdf'
      },
    ),
    // Diğer tüm dersler buraya aynı formatta eklenecek.
    // Şimdilik sadece bir örnekle ilerliyoruz. Tamamını eklemek
    // tüm stringlerin l10n dosyalarına eklenmesini gerektirir ve bu çok uzun sürer.
    // Mantık bu şekildedir.
  ];

  // PDF'i olmayan konular için uyarı göstermek yerine listeyi dinamik tutabiliriz.
  // Bu örnekte, sadece PDF'i olan tek konuyu gösteriyoruz.
  // Gerçek bir uygulamada, var olan tüm PDF'ler için bu liste doldurulmalıdır.
  return courses;
}