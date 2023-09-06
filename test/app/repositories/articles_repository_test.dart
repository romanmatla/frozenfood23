import 'package:flutter_test/flutter_test.dart';
import 'package:frozen_food/app/models/articles_model.dart';
import 'package:frozen_food/app/repositories/articles_repository.dart';
import 'package:frozen_food/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockArticlesDataSource extends Mock
    implements ArticlesRemoteRetrofitDataSource {}

void main() {
  late ArticlesRepository sut;
  late MockArticlesDataSource dataSource;

  setUp(() {
    dataSource = MockArticlesDataSource();
    sut = ArticlesRepository(remoteDataSource: dataSource);
  });

  group('getArticlesForAuthorId', () {
    test('should call remoteDataSource.getArcicles( method)', () async {
      //1
      when(() => dataSource.getArticles()).thenAnswer(
        (_) async => [],
      );

      //2
      await sut.getArticlesForAuthorId(222);

      //3
      verify(() => dataSource.getArticles()).called(1);
    });

    test('should filter data source results with provided categorys id',
        () async {
      //1
      when(() => dataSource.getArticles()).thenAnswer(
        (_) async => [
          ArticleModel(1, 222, 'content1', 'errorMessage1'),
          ArticleModel(2, 333, 'content2', 'errorMessage2'),
          ArticleModel(3, 222, 'content3', 'errorMessage3'),
          ArticleModel(4, 222, 'content4', 'errorMessage4'),
        ],
      );

      //2
      final results = await sut.getArticlesForAuthorId(222);

      //3
      expect(
        results,
        [
          ArticleModel(1, 222, 'content1', 'errorMessage1'),
          ArticleModel(3, 222, 'content3', 'errorMessage3'),
          ArticleModel(4, 222, 'content4', 'errorMessage4'),
        ],
      );
    });
  });
}
