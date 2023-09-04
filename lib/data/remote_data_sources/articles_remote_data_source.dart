import 'package:dio/dio.dart';
import 'package:frozen_food/app/models/articles_model.dart';

import 'package:retrofit/retrofit.dart';

part 'articles_remote_data_source.g.dart';

@RestApi(baseUrl: "https://my-json-server.typicode.com/romanmatla/json_forzen")
abstract class ArticlesRemoteRetrofitDataSource {
  factory ArticlesRemoteRetrofitDataSource(Dio dio, {String baseUrl}) = _ArticlesRemoteRetrofitDataSource;

  @GET("/articles")
  Future<List<ArticleModel>> getArticles();
}