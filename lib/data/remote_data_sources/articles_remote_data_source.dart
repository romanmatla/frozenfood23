class ArticlesMockedDataSource {
  Future<List<Map<String, dynamic>>?> getArticles() async {
    return [
      {
        'id': 1,
        'author_id': 1,
        'content': 'Poprawić ten container!',
      },
      {
        'id': 2,
        'author_id': 2,
        'content': 'Litwo! Ojczyzno moja!  ojskiego zagłuszył.'
      },
    ];
  }
}
