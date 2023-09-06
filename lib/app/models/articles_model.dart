import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_model.g.dart';
part 'articles_model.freezed.dart';

@freezed
class ArticleModel with _$ArticleModel {
  factory ArticleModel(
    int id,
    @JsonKey(name: 'categorys_id') int categorysId,
    String content, String? errorMessage,

  ) = _ArticleModel;
  

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}


