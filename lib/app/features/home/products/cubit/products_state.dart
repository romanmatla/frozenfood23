part of 'products_cubit.dart';

@immutable
class ProductsState {
  const ProductsState({
    this.documents = const [],
    required this.isLoading,
    required this.errorMessage,
  });

  final List<ProductModel> documents;
  final bool isLoading;
  final String errorMessage;
}
