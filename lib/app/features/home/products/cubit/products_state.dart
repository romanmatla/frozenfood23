part of 'products_cubit.dart';

@immutable
class ProductsState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const ProductsState(
      {required this.documents,
      required this.isLoading,
      required this.errorMessage});
}
