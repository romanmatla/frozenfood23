part of 'add_cubit.dart';

@freezed
class AddState with _$AddState {
  factory AddState({
    @Default(false) bool saved,
    String? errorMessage,
  }
    ) = _AddState;
}