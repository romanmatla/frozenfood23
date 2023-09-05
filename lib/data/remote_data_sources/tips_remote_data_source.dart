import 'package:dio/dio.dart';
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'tips_remote_data_source.g.dart';


@injectable 
@RestApi()
abstract class TipsRemoteRetrofitDataSource {

  @factoryMethod 
  factory TipsRemoteRetrofitDataSource(Dio dio) = _TipsRemoteRetrofitDataSource;

  @GET("/categorys")
  Future<List<TipsModel>> getTips();
}

