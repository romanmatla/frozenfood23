part of 'advice_cubit.dart';

@immutable
class AdviceState {
  const AdviceState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;
}
