import 'package:frozen_food/app/models/articles_model.dart';
import 'package:frozen_food/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:injectable/injectable.dart';



@injectable 
class ArticlesRepository {
  ArticlesRepository({required this.remoteDataSource});

  final ArticlesRemoteRetrofitDataSource remoteDataSource;

  Future<List<ArticleModel>> getArticlesForAuthorId(int categorysId) async {
    final allArticles = await remoteDataSource.getArticles();

    return allArticles
        .where((article) => article.categorysId == categorysId)
        .toList();
  }
}
