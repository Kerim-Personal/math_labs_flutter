import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AiService {
  final GenerativeModel _model;

  AiService()
      : _model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: dotenv.env['GEMINI_API_KEY']!,
  );

  Future<String> getResponse(String userQuestion, {String? contextText}) async {
    try {
      final prompt = """
      Kullanıcının sorusunu genel bilginize dayanarak en fazla 100 karakter uzunluğunda yanıtlayın.
      Cevabınızı Markdown formatında ve Türkçe olarak verin.
      Sadece net ve öz cevaplar verin.
      
      Kullanıcı Sorusu: "$userQuestion"
      """;

      final response = await _model.generateContent([Content.text(prompt)]);
      return response.text ?? "Bir cevap alınamadı, lütfen tekrar deneyin.";
    } catch (e) {
      print("AI Service Error: $e");
      return "Bir hata oluştu. Lütfen API anahtarınızı ve internet bağlantınızı kontrol edin.";
    }
  }
}