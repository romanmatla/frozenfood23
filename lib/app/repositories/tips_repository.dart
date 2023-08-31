
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:frozen_food/data/remote_data_sources/tips_remote_data_source.dart';

class TipsRepository {
TipsRepository({required this.remoteDataSource});

  final TipsMockDataSource remoteDataSource;

  Future<List<TipsModel>> getTipsModels() async {
    final json = await remoteDataSource.getTips();
    if (json == null) {
      return [];
    }
    return json.map((item) => TipsModel.fromJson(item)).toList();
  }

  // Future<TipsModel?> getTipsModel() async {
  //   final response = await Dio().get<Map<String, dynamic>>(
  //       'https://my-json-server.typicode.com/adamsmaka/json-demo/users');
  //   final responseData = response.data;

  //   if (responseData == null) {
  //     return null;
  //   }

  //   final name = responseData['email'] as String;

  //   return TipsModel();
  // }
}
