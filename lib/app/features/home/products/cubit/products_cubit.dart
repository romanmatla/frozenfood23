import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frozen_food/app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit()
      : super(
          const ProductsState(
            documents: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start({required String categories}) async {
    emit(
      const ProductsState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('product')
        .where('categories', isEqualTo: categories)
        .snapshots()
        .where((event) => true)
        .listen((data) {
      final productModels = data.docs.map(
        (doc) {
          return ProductModel(
            id: doc.id,
            title: doc['name'],
            dataAdded: (doc['date added'] as Timestamp).toDate(),
            expirationDate: (doc['expiration date'] as Timestamp).toDate(),
            quantity: doc['quantity'],
          );
        },
      ).toList();
      emit(
        ProductsState(
          documents: productModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ProductsState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> remove({required String documentID}) async {
    try {
      FirebaseFirestore.instance.collection('product').doc(documentID).delete();
    } catch (error) {
      emit(
        ProductsState(
          documents: const [],
          isLoading: false,
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
