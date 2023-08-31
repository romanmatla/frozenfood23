class TipsModel {
  TipsModel({
    required this.title,
  });

  final String title;

  TipsModel.fromJson(Map<String, dynamic> json) 
: title = json['email'];
}

