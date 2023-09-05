// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TipsModel _$$_TipsModelFromJson(Map<String, dynamic> json) => _$_TipsModel(
      json['id'] as int,
      json['title'] as String,
      json['picture'] as String,
      json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$_TipsModelToJson(_$_TipsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'picture': instance.picture,
      'errorMessage': instance.errorMessage,
    };
