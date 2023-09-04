import 'package:json_annotation/json_annotation.dart';

part 'articles_model.g.dart';

@JsonSerializable()
class ArticleModel {
  ArticleModel({
    required this.id,
    required this.categorysId,
    required this.content,
  });

  final int id;

  @JsonKey(name: 'categorys_id')
  final int categorysId;

  final String content;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
