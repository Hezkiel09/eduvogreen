class ArticleModel {
  final String id;
  final String title;
  final String category;
  final List<String> tags;
  final String thumbnail; 
  final String content;
  final List<String> references;
  final String authorName;
  final String authorType; 
  final String publishDate;
  final int readTimeMinutes;
  bool isBookmarked;

  ArticleModel({
    required this.id,
    required this.title,
    required this.category,
    required this.tags,
    required this.thumbnail,
    required this.content,
    required this.references,
    required this.authorName,
    required this.authorType,
    required this.publishDate,
    required this.readTimeMinutes,
    this.isBookmarked = false,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      tags: List<String>.from(json['tags'] ?? []),
      thumbnail: json['thumbnail'] as String? ?? '',
      content: json['content'] as String,
      references: List<String>.from(json['references_list'] ?? []),
      authorName: json['author_name'] as String,
      authorType: json['author_type'] as String,
      publishDate: json['publish_date'] as String,
      readTimeMinutes: json['read_time_minutes'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id.isNotEmpty) 'id': id,
      'title': title,
      'category': category,
      'tags': tags,
      'thumbnail': thumbnail,
      'content': content,
      'references_list': references,
      'author_name': authorName,
      'author_type': authorType,
      'publish_date': publishDate,
      'read_time_minutes': readTimeMinutes,
      // 'created_at'
    };
  }
}

