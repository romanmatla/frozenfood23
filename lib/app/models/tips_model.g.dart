// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tips_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipsModel _$TipsModelFromJson(Map<String, dynamic> json) => TipsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$TipsModelToJson(TipsModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'picture': instance.picture,
    };
