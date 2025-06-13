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
  late final PdfAnnotationManager _annotationManager;


  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _aiService = AiService();
    _annotationManager = PdfAnnotationManager();
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
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => setState(() {
              _annotationManager.mode = AnnotationMode.freeHand;
            }),
          ),
          IconButton(
            icon: const Icon(Icons.square_outlined),
            onPressed: () => setState(() {
              _annotationManager.mode = AnnotationMode.rectangle;
            }),
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () => _annotationManager.undo(),
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () => _annotationManager.clear(),
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        widget.pdfPath,
        controller: _pdfViewerController,
        annotationManager: _annotationManager,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAiChatDialog,
        backgroundColor: theme.colorScheme.primary,
        child: Icon(Icons.chat_bubble, color: theme.colorScheme.onPrimary),
      ),
    );
  }
}