class TipsModel {
  TipsModel({
    required this.title,
    required this.picture,
  });

  final String title;
  final String picture;

  TipsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        picture = json['picture'];
}
