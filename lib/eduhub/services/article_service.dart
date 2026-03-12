import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/article_model.dart';

class ArticleService {
  final _supabase = Supabase.instance.client;
  final String _tableName = 'articles';

  // ambil artikel dri supabase
  Future<List<ArticleModel>> getArticles() async {
    try {
      final response = await _supabase
          .from(_tableName)
          .select()
          .order('created_at', ascending: false);

      return (response as List<dynamic>)
          .map((json) => ArticleModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching articles: $e');
      throw Exception('Gagal memuat artikel: $e');
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
