import 'package:dio/dio.dart';



class TipsRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getTips() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/romanmatla/json_forzen/categorys');
    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
