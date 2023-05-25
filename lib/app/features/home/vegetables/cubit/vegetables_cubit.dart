import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'vegetables_state.dart';

class VegetablesCubit extends Cubit<VegetablesState> {
  VegetablesCubit()
      : super(
          const VegetablesState(
            documents: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const VegetablesState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('product')
        .where('categories', isEqualTo: 'Warzywa')
        .snapshots()
        .where((event) => true)
        .listen((data) {
      emit(
        VegetablesState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          VegetablesState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
