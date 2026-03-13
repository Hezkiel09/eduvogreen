part of 'article_cubit.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<ArticleModel> articles;
  ArticleLoaded(this.articles);
}

class ArticleSuccess extends ArticleState {
  final String message;
  ArticleSuccess(this.message);
}

class ArticleError extends ArticleState {
  final String errorMessage;
  ArticleError(this.errorMessage);
}
