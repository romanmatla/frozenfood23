class TipsModel {
  TipsModel({
    required this.id,
    required this.title,
    required this.picture,
  });

  final int id;
  final String title;

  final String picture;

  TipsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
      title = json['title'],
        picture = json['picture'];
}
