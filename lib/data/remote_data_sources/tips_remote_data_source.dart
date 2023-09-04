import 'package:dio/dio.dart';
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:retrofit/retrofit.dart';

part 'tips_remote_data_source.g.dart';

@RestApi(baseUrl: "https://my-json-server.typicode.com/romanmatla/json_forzen")
abstract class TipsRemoteRetrofitDataSource {
  factory TipsRemoteRetrofitDataSource(Dio dio, {String baseUrl}) = _TipsRemoteRetrofitDataSource;

  @GET("/categorys")
  Future<List<TipsModel>> getTips();
}

