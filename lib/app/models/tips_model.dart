import 'package:json_annotation/json_annotation.dart';

part 'tips_model.g.dart';

@JsonSerializable()
class TipsModel {
  TipsModel({
    required this.id,
    required this.title,
    required this.picture,
  });

  final int id;
  final String title;
  final String picture;

  factory TipsModel.fromJson(Map<String, dynamic> json) =>
      _$TipsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TipsModelToJson(this);
}
