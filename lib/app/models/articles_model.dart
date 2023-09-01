class ArticleModel {
  ArticleModel({
    required this.id,
    required this.authorId,
    required this.content,
  });

  final int id;
  final int authorId;
  final String content;

  ArticleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        authorId = json['categorys_id'],
        content = json['content'];
}
