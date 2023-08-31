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
