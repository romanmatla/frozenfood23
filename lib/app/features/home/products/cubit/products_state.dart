part of 'products_cubit.dart';

@immutable
class ProductsState {
  const ProductsState({
    this.documents = const [],
    required this.status,
    // required this.isLoading,
     this.errorMessage,
  });

  final List<ProductModel> documents;
  final Status status;
  // final bool isLoading;
  final String? errorMessage;
}
