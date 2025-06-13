import 'package:flutter/material.dart';
import 'package:math_labs_flutter/services/ai_service.dart';
import 'package:math_labs_flutter/widgets/ai_chat_dialog.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
  late final AiService _aiService;
  // --- ÇÖZÜM ---
  // PdfAnnotationManager kaldırıldı. Artık gerekli değil.

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _aiService = AiService();
    // _annotationManager'ın başlatılması kaldırıldı.
  }

  void _showAiChatDialog() {
    showDialog(
      context: context,
      builder: (context) => AiChatDialog(aiService: _aiService),
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
          // --- ÇÖZÜM ---
          // Tüm onPressed metotları _pdfViewerController kullanacak şekilde güncellendi.
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Annotation (not alma) modunu doğrudan controller üzerinden ayarlıyoruz.
              _pdfViewerController.annotationMode = AnnotationMode.freehand;
            },
          ),
          IconButton(
            icon: const Icon(Icons.square_outlined),
            onPressed: () {
              _pdfViewerController.annotationMode = AnnotationMode.rectangle;
            },
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              // Geri alma işlemi controller üzerinden yapılıyor.
              _pdfViewerController.undo();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              // Tümünü temizleme işlemi controller üzerinden yapılıyor.
              _pdfViewerController.clearAnnotations();
            },
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        widget.pdfPath,
        controller: _pdfViewerController,
        // --- ÇÖZÜM ---
        // annotationManager parametresi kaldırıldı çünkü artık mevcut değil.
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAiChatDialog,
        backgroundColor: theme.colorScheme.primary,
        child: Icon(Icons.chat_bubble, color: theme.colorScheme.onPrimary),
      ),
    );
  }
}