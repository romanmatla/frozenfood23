part of 'vegetables_cubit.dart';

@immutable
class VegetablesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const VegetablesState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
