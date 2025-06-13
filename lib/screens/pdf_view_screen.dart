import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// AI Servisini ve Chat Diyaloğunu sonraki adımlarda oluşturacağız.
// import 'package:pdf/services/ai_service.dart';
// import 'package:pdf/widgets/ai_chat_dialog.dart';

class PdfViewScreen extends StatefulWidget {
  final String pdfPath;
  final String title;

  const PdfViewScreen({
    super.key,
    required this.pdfPath,
    required this.title,
  });

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  late final PdfViewerController _pdfViewerController;
  // late final AiService _aiService; // Sonraki adımda aktif edilecek

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    // _aiService = AiService(); // Sonraki adımda aktif edilecek
  }

  void _showAiChatDialog() {
    // Bu fonksiyonu AiService'i oluşturduktan sonra dolduracağız.
    // Şimdilik sadece bir uyarı gösterelim.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Yapay Zeka asistanı yakında burada olacak!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: theme.colorScheme.onPrimary)),
        backgroundColor: theme.colorScheme.primary,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
        actions: [
          // Çizim (Annotation) araçları için butonlar
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Kalem modunu başlat
              _pdfViewerController.annotationManager.setAnnotationMode(AnnotationMode.freeHand);
            },
          ),
          IconButton(
            icon: const Icon(Icons.square_outlined), // Silgi için daha iyi bir ikon bulunabilir
            onPressed: () {
              // Silgi modunu başlat
              _pdfViewerController.annotationManager.setAnnotationMode(AnnotationMode.eraser);
            },
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              // Son çizimi geri al
              _pdfViewerController.annotationManager.undo();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              // Tüm çizimleri temizle
              _pdfViewerController.annotationManager.clearAnnotations();
            },
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        widget.pdfPath,
        controller: _pdfViewerController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAiChatDialog,
        backgroundColor: theme.colorScheme.primary,
        child: Icon(Icons.chat_bubble, color: theme.colorScheme.onPrimary),
      ),
    );
  }
}