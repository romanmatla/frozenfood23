part of 'article_cubit.dart';

@immutable
class ArticleState {
  const ArticleState({
    this.results = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<ArticleModel> results;
  final Status status;
  final String? errorMessage;
}
