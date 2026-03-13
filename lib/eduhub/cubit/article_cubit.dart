import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleService _articleService;

  ArticleCubit(this._articleService) : super(ArticleInitial());

  Future<void> submitArticle(
    ArticleModel article, {
    File? thumbnailFile,
  }) async {
    emit(ArticleLoading());
    try {
      String thumbnailUrl = '';

      // 1. Upload thumbnail ke Supabase Storage dulu jika ada
      if (thumbnailFile != null) {
        thumbnailUrl = await _articleService.uploadThumbnail(thumbnailFile);
      }

      // 2. Buat article baru dengan thumbnail URL yang sudah diupload
      final articleWithThumbnail = ArticleModel(
        id: article.id,
        title: article.title,
        category: article.category,
        tags: article.tags,
        thumbnail: thumbnailUrl,
        content: article.content,
        references: article.references,
        authorName: article.authorName,
        authorType: article.authorType,
        publishDate: article.publishDate,
        readTimeMinutes: article.readTimeMinutes,
        status: article.status,
      );

      // 3. Insert artikel ke Supabase DB
      await _articleService.addArticle(articleWithThumbnail);
      emit(ArticleSuccess('Artikel berhasil diajukan! Menunggu review admin.'));
    } catch (e) {
      emit(ArticleError('Gagal mengirim artikel: $e'));
    }
  }
}
