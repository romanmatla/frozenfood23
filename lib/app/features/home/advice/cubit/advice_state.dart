part of 'advice_cubit.dart';

@immutable
class AdviceState {
  const AdviceState({
    this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });

  final List<AdviceModel> documents;
  final bool isLoading;
  final String errorMessage;
}
