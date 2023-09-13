part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  factory ProductsState({
    @Default([]) List<ProductModel> documents,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _ProductsState;
}
