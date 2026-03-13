enum ArtikelStatus {
  belumDitinjau,
  prosesPeninjauan,
  revisiUser,
  disetujui,
}

class ArtikelModel {
  final String id;
  final String title;
  final String description;
  final String author;
  final String date;
  final String category;
  final String image;
  ArtikelStatus status;
  String reviewer;
  String revisionReason;
  List<String> proofFiles;

  ArtikelModel({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.date,
    required this.category,
    required this.image,
    required this.status,
    this.reviewer = '',
    this.revisionReason = '',
    this.proofFiles = const [],
  });
}