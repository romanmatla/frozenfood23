import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frozen_food/app/core/enums.dart';
import 'package:frozen_food/app/models/product_model.dart';
import 'package:frozen_food/app/repositories/product_repository.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productRepository)
      : super(
          const ProductsState(
            documents: [],
            status: Status.initial,
            // isLoading: false,
            // errorMessage: '',
          ),
        );

  final ProductRepository _productRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start({required String categories}) async {
    emit(
      const ProductsState(
        documents: [],
        status: Status.loading,
      ),
    );

    _streamSubscription = _productRepository
        .getProductStream(categories: categories)
        .where((event) => true)
        .listen((data) {
      emit(
        ProductsState(
          documents: data,
          status: Status.success,
        ),
      );
    })
      ..onError((error) {
        emit(
          ProductsState(
            documents: const [],
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _productRepository.delete(id: documentID);
    } catch (error) {
      emit(
        ProductsState(
          documents: const [],
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
