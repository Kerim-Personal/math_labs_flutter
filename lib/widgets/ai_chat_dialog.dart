import 'package:flutter/material.dart';
import 'package:math_labs_flutter/services/ai_service.dart';

class AiChatDialog extends StatefulWidget {
  final AiService aiService;

  const AiChatDialog({super.key, required this.aiService});

  @override
  State<AiChatDialog> createState() => _AiChatDialogState();
}

class _AiChatDialogState extends State<AiChatDialog> {
  final _textController = TextEditingController();
  String? _response;
  bool _isLoading = false;

  void _sendMessage() async {
    if (_textController.text.isEmpty) return;

    setState(() {
      _isLoading = true;
      _response = null;
    });

    try {
      final response = await widget.aiService.getResponse(_textController.text);
      setState(() => _response = response);
    } catch (e) {
      setState(() => _response = 'An error occurred. Please try again.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ask AI Assistant'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(hintText: 'Ask a question...'),
              onSubmitted: (_) => _sendMessage(),
            ),
            const SizedBox(height: 20),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_response != null)
              Text(_response!),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _sendMessage,
          child: const Text('Send'),
        )
      ],
    );
  }
}