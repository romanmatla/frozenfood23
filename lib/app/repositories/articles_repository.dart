import 'package:frozen_food/app/models/articles_model.dart';
import 'package:frozen_food/data/remote_data_sources/articles_remote_data_source.dart';

class ArticlesRepository {
  ArticlesRepository({required this.remoteDataSource});

  final ArticlesRemoteDioDataSource remoteDataSource;

  Future<List<ArticleModel>> getArticlesForAuthorId(int authotId) async {
    final json = await remoteDataSource.getArticles();
if (json == null) {
      return [];
    }
    final allArticles =
        json.map((item) => ArticleModel.fromJson(item)).toList();

    return allArticles
        .where((element) => element.authorId == authotId)
        .toList();
  }
}
