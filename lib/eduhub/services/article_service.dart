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

  // Cari artikel berdasarkan judul (search)
  Future<List<ArticleModel>> searchArticles(String query) async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .eq('status', 'approved')
          .ilike(
            'title',
            '%$query%',
          ) // Filter berdasarkan judul (case-insensitive)
          .order('created_at', ascending: false);

      return (response as List<dynamic>)
          .map((json) => ArticleModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error searching articles: $e');
      throw Exception('Gagal mencari artikel: $e');
    }
  }

  // upload thumbnail ke Supabase Storage, return public URL
  Future<String> uploadThumbnail(File imageFile) async {
    try {
      final fileName = 'article_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await _supabase.storage.from(_bucketName).upload(fileName, imageFile);
      final publicUrl = _supabase.storage
          .from(_bucketName)
          .getPublicUrl(fileName);
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

  // Toggle simpan artikel
  Future<void> toggleSaveArticle(
    String userId,
    String articleId,
    bool isAlreadySaved,
  ) async {
    try {
      if (isAlreadySaved) {
        await _supabase.from('saved_articles').delete().match({
          'user_id': userId,
          'article_id': articleId,
        });
      } else {
        await _supabase.from('saved_articles').insert({
          'user_id': userId,
          'article_id': articleId,
        });
      }
    } catch (e) {
      print('Error toggling save article: $e');
      throw Exception('Gagal memproses simpan artikel: $e');
    }
  }

  // Cek apakah artikel sudah disimpan
  Future<bool> isArticleSaved(String userId, String articleId) async {
    try {
      final response = await _supabase.from('saved_articles').select().match({
        'user_id': userId,
        'article_id': articleId,
      }).maybeSingle();

      return response != null;
    } catch (e) {
      print('Error checking saved status: $e');
      return false;
    }
  }

  // Ambil semua artikel yang di-save oleh user
  Future<List<ArticleModel>> getSavedArticles(String userId) async {
    try {
      final response = await _supabase
          .from('saved_articles')
          .select('articles (*)')
          .eq('user_id', userId);

      final data = response as List<dynamic>;
      return data
          .where((item) => item['articles'] != null)
          .map(
            (item) =>
                ArticleModel.fromJson(item['articles'] as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      print('Error fetching saved articles: $e');
      throw Exception('Gagal memuat artikel simpanan: $e');
    }
  }
}
