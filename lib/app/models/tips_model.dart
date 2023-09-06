import 'package:freezed_annotation/freezed_annotation.dart';

part 'tips_model.g.dart';
part 'tips_model.freezed.dart';

@freezed
class TipsModel with _$TipsModel {
  factory TipsModel(
    int id,
    String title,
    String picture,
    String? errorMessage,
  ) = _TipsModel;

  factory TipsModel.fromJson(Map<String, dynamic> json) =>
      _$TipsModelFromJson(json);
}