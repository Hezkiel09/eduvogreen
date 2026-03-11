import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/article_model.dart';
import '../services/article_service.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleService _articleService;

  ArticleCubit(this._articleService) : super(ArticleInitial());

  Future<void> submitArticle(ArticleModel article) async {
    emit(ArticleLoading());
    try {
      await _articleService.addArticle(article);
      emit(ArticleSuccess('Artikel Berhasil Dipublish!'));
    } catch (e) {
      emit(ArticleError('Gagal mengirim artikel: \$e'));
    }
  }
}
