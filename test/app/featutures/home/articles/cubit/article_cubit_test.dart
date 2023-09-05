import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frozen_food/app/core/enums.dart';
import 'package:frozen_food/app/features/home/articles/cubit/article_cubit.dart';
import 'package:frozen_food/app/models/articles_model.dart';
import 'package:frozen_food/app/repositories/articles_repository.dart';
import 'package:mocktail/mocktail.dart';

class MocArticlesRepository extends Mock implements ArticlesRepository {}

void main() {
  late ArticleCubit sut;
  late MocArticlesRepository repository;

  setUp(() {
    repository = MocArticlesRepository();
    sut = ArticleCubit(articleRepository: repository);
  });

  group('fetchData', () {
    group('success', () {
      setUp(() {
        when(() => repository.getArticlesForAuthorId(11)).thenAnswer(
          (_) async => [
            ArticleModel(1, 11, "content1"),
            ArticleModel(2, 11, "content2"),
            ArticleModel(3, 11, "content3"),
          ],
        );
      });

      blocTest<ArticleCubit, ArticleState>(
        'emit Status.loading then Status.success with result',
        build: () => sut,
        act: (cubit) => cubit.fetchData(categorysId: 11),
        expect: () => [
          const ArticleState(
            status: Status.loading,
          ),
          ArticleState(
            status: Status.success,
            results: [
              ArticleModel(1, 11, "content1"),
              ArticleModel(2, 11, "content2"),
              ArticleModel(3, 11, "content3"),
            ],
          ),
        ],
      );
    });
  });

  group('failure', () {
    setUp(() {
      when(() => repository.getArticlesForAuthorId(11)).thenThrow(
        Exception('test-exception-error'),
      );
    });

    blocTest<ArticleCubit, ArticleState>(
      'emit Status.loading then Status.error with errorMessage',
      build: () => sut,
      act: (cubit) => cubit.fetchData(categorysId: 11),
      expect: () => [
        const ArticleState(
          status: Status.loading,
        ),
        const ArticleState(
          status: Status.error,
          errorMessage: 'Exception: test-exception-error',
        ),
      ],
    );
  });
}
