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
