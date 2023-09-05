import 'package:dio/dio.dart';
import 'package:frozen_food/app/models/articles_model.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';

part 'articles_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class ArticlesRemoteRetrofitDataSource {
  @factoryMethod
  factory ArticlesRemoteRetrofitDataSource(Dio dio) =
      _ArticlesRemoteRetrofitDataSource;

  @GET("/articles")
  Future<List<ArticleModel>> getArticles();
}
