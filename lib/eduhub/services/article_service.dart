import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/article_model.dart';

class ArticleService {
  final _supabase = Supabase.instance.client;
  final String _tableName = 'articles';
  final String _bucketName = 'thumbnails_article';

  // ambil artikel dari supabase (hanya yang approved)
  Future<List<ArticleModel>> getArticles() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('status', 'approved')
          .order('created_at', ascending: false);

      return (response as List<dynamic>)
          .map((json) => ArticleModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching articles: $e');
      throw Exception('Gagal memuat artikel: $e');
    }
  }

  // upload thumbnail ke Supabase Storage, return public URL
  Future<String> uploadThumbnail(File imageFile) async {
    try {
      final fileName = 'article_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await _supabase.storage.from(_bucketName).upload(fileName, imageFile);
      final publicUrl =
          _supabase.storage.from(_bucketName).getPublicUrl(fileName);
      return publicUrl;
    } catch (e) {
      print('Error uploading thumbnail: $e');
      throw Exception('Gagal mengunggah thumbnail: $e');
    }
  }

  // add new artikel
  Future<void> addArticle(ArticleModel article) async {
    try {
      await _supabase.from(_tableName).insert(article.toJson());
    } catch (e) {
      print('Error adding article: $e');
      throw Exception('Gagal menyimpan artikel: $e');
    }
  }
}
