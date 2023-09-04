class ArticleModel {
  ArticleModel({
    required this.id,
    required this.categorysId,
    required this.content,
  });

  final int id;
  final int categorysId;
  final String content;

  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        categorysId = json['categorys_id'],
        content = json['content'];
}
