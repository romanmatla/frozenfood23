// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tips_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TipsModel _$TipsModelFromJson(Map<String, dynamic> json) {
  return _TipsModel.fromJson(json);
}

/// @nodoc
mixin _$TipsModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipsModelCopyWith<TipsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsModelCopyWith<$Res> {
  factory $TipsModelCopyWith(TipsModel value, $Res Function(TipsModel) then) =
      _$TipsModelCopyWithImpl<$Res, TipsModel>;
  @useResult
  $Res call({int id, String title, String picture, String? errorMessage});
}

/// @nodoc
class _$TipsModelCopyWithImpl<$Res, $Val extends TipsModel>
    implements $TipsModelCopyWith<$Res> {
  _$TipsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? picture = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TipsModelCopyWith<$Res> implements $TipsModelCopyWith<$Res> {
  factory _$$_TipsModelCopyWith(
          _$_TipsModel value, $Res Function(_$_TipsModel) then) =
      __$$_TipsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String picture, String? errorMessage});
}

/// @nodoc
class __$$_TipsModelCopyWithImpl<$Res>
    extends _$TipsModelCopyWithImpl<$Res, _$_TipsModel>
    implements _$$_TipsModelCopyWith<$Res> {
  __$$_TipsModelCopyWithImpl(
      _$_TipsModel _value, $Res Function(_$_TipsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? picture = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_TipsModel(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TipsModel implements _TipsModel {
  _$_TipsModel(this.id, this.title, this.picture, this.errorMessage);

  factory _$_TipsModel.fromJson(Map<String, dynamic> json) =>
      _$$_TipsModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String picture;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'TipsModel(id: $id, title: $title, picture: $picture, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TipsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, picture, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TipsModelCopyWith<_$_TipsModel> get copyWith =>
      __$$_TipsModelCopyWithImpl<_$_TipsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TipsModelToJson(
      this,
    );
  }
}

abstract class _TipsModel implements TipsModel {
  factory _TipsModel(final int id, final String title, final String picture,
      final String? errorMessage) = _$_TipsModel;

  factory _TipsModel.fromJson(Map<String, dynamic> json) =
      _$_TipsModel.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get picture;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_TipsModelCopyWith<_$_TipsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
