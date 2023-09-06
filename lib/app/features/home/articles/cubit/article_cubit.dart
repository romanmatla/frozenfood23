import 'package:bloc/bloc.dart';
import 'package:frozen_food/app/core/enums.dart';
import 'package:frozen_food/app/models/articles_model.dart';
import 'package:frozen_food/app/repositories/articles_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'article_state.dart';
part 'article_cubit.freezed.dart';


@injectable 
class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit({required this.articleRepository})
      : super(
          const ArticleState(),
        );

  final ArticlesRepository articleRepository;

  Future<void> fetchData({required int categorysId}) async {
    emit(
      const ArticleState(
        status: Status.loading,
      ),
    );
    try {
      final results =
          await articleRepository.getArticlesForAuthorId(categorysId);
      emit(
        ArticleState(
          status: Status.success,
          results: results,
        ),
      );
      
    } catch (error) {
      emit(
        ArticleState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
