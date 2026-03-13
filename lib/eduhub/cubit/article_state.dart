part of 'article_cubit.dart';

abstract class ArticleState {}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {
  final String message;
  ArticleSuccess(this.message);
}

class ArticleError extends ArticleState {
  final String errorMessage;
  ArticleError(this.errorMessage);
}
