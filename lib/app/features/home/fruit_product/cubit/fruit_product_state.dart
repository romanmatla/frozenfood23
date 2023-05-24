part of 'fruit_product_cubit.dart';

@immutable
class FruitProductState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const FruitProductState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
