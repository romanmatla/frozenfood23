part of 'tips_cubit.dart';


@freezed
class TipsState with _$TipsState {
  const factory TipsState({
    @Default([]) List<TipsModel> result,
    @Default(Status.initial) Status status,
  }) = _TipsState;
}
