part of 'tips_cubit.dart';

@immutable
class TipsState {
  const TipsState({
    this.result = const [],
    // required this.isLoading,
    // required this.errorMessage,
    required this.status,
    // this.model,
  });

  final List<TipsModel> result;
  // final bool isLoading;
  // final String errorMessage;
  final Status status;
  // final TipsModel? model;
}
