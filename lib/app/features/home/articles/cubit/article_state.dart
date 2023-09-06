part of 'article_cubit.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState({
    @Default([]) List<ArticleModel> results,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _ArticleState;
  
}
