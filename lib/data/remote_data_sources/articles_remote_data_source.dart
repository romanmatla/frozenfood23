import 'package:dio/dio.dart';

class ArticlesMockedDataSource {
  Future<List<Map<String, dynamic>>?> getArticles() async {
    return [
      {
        'id': 1,
        'author_id': 1,
        'content':
            'Poprawić ten container!Poprawić ten container!Poprawić ten container!Poprawić ten containerPoprawić ten container!Poprawić ten container!Poprawić ten containerPoprawić ten container!Poprawić ten container!Poprawić ten containerPoprawić ten container!Poprawić ten container!Poprawić ten containerPoprawić ten container!Poprawić ten container!',
      },
      {
        'id': 2,
        'author_id': 2,
        'content':
            'Litwo! Ojczyzno moja!  Poprawić ten container!Poprawić ten container!Poprawić ten containerPoprawić ten container!Poprawić ten container!Poprawić ten containerPoprawić ten container!Poprawić ten container!Poprawić ten containerojskiego zagłuszył.'
      },
      {
        'id': 3,
        'author_id': 2,
        'content':
            'Litwo! Ojczyzno moja!  Poprawić ten container!Poprawić ten container!Poprawić ten containerPoprawić ten container!Poprawić ten container!Poprawić ten containerPoprawić ten container!Poprawić ten container!Poprawić ten containerojskiego zagłuszył.'
      },
    ];
  }
}

  class ArticlesRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getArticles() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/romanmatla/json_forzen/articles');
    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
}
}
