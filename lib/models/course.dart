class Course {
  final String title;
  final List<String> topics;
  final Map<String, String> topicPdfPaths; // Konu başlığı -> PDF dosya yolu
  bool isExpanded;

  Course({
    required this.title,
    required this.topics,
    required this.topicPdfPaths,
    this.isExpanded = false,
  });
}