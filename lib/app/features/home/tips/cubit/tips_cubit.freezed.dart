// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tips_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TipsState {
  List<TipsModel> get result => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TipsStateCopyWith<TipsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsStateCopyWith<$Res> {
  factory $TipsStateCopyWith(TipsState value, $Res Function(TipsState) then) =
      _$TipsStateCopyWithImpl<$Res, TipsState>;
  @useResult
  $Res call({List<TipsModel> result, Status status});
}

/// @nodoc
class _$TipsStateCopyWithImpl<$Res, $Val extends TipsState>
    implements $TipsStateCopyWith<$Res> {
  _$TipsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<TipsModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TipsStateCopyWith<$Res> implements $TipsStateCopyWith<$Res> {
  factory _$$_TipsStateCopyWith(
          _$_TipsState value, $Res Function(_$_TipsState) then) =
      __$$_TipsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TipsModel> result, Status status});
}

/// @nodoc
class __$$_TipsStateCopyWithImpl<$Res>
    extends _$TipsStateCopyWithImpl<$Res, _$_TipsState>
    implements _$$_TipsStateCopyWith<$Res> {
  __$$_TipsStateCopyWithImpl(
      _$_TipsState _value, $Res Function(_$_TipsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? status = null,
  }) {
    return _then(_$_TipsState(
      result: null == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<TipsModel>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$_TipsState implements _TipsState {
  const _$_TipsState(
      {final List<TipsModel> result = const [], this.status = Status.initial})
      : _result = result;

  final List<TipsModel> _result;
  @override
  @JsonKey()
  List<TipsModel> get result {
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'TipsState(result: $result, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TipsState &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_result), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TipsStateCopyWith<_$_TipsState> get copyWith =>
      __$$_TipsStateCopyWithImpl<_$_TipsState>(this, _$identity);
}

abstract class _TipsState implements TipsState {
  const factory _TipsState(
      {final List<TipsModel> result, final Status status}) = _$_TipsState;

  @override
  List<TipsModel> get result;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$_TipsStateCopyWith<_$_TipsState> get copyWith =>
      throw _privateConstructorUsedError;
}
