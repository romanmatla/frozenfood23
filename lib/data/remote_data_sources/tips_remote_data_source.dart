import 'package:dio/dio.dart';

  class TipsMockDataSource {
  Future<List<Map<String, dynamic>>?> getTips() async {
    return [
      {
        'id': 1,
        'picture':
            'https://moje-kosmetyki.eu/wp-content/uploads/2023/08/sniezynka.jpg',
        'email': 'Piotr',
      },
      {
        'id': 1,
        'picture':
            'https://moje-kosmetyki.eu/wp-content/uploads/2023/08/sniezynka.jpg',
        'email': 'Michał',
      },
      {
        'id': 1,
        'picture':
            'https://moje-kosmetyki.eu/wp-content/uploads/2023/08/sniezynka.jpg',
        'email': 'Krzyś',
      },
    ];
  }
}

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
