import 'package:flutter_test/flutter_test.dart';
import 'package:frozen_food/app/repositories/articles_repository.dart';
import 'package:frozen_food/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockArticlesDataSource extends Mock
    implements ArticlesRemoteDioDataSource {}

void main() {
  late ArticlesRepository sut;
  late MockArticlesDataSource dataSource;

  setUp(() {
    dataSource = MockArticlesDataSource();
    sut = ArticlesRepository(remoteDataSource: dataSource);
  });
  group('getArticlesForAuthorId', () {
    test('description', () {
      // 1
      when(() => dataSource.getArticles()).thenAnswer(
        (_) async => [],
      );

      // 2

      // 3
    });
  });
}
