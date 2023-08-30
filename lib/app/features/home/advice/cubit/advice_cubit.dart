import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frozen_food/app/models/advice_mode.dart';
import 'package:meta/meta.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit()
      : super(
          const AdviceState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AdviceState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('topic')
        .snapshots()
        .listen((data) {
      final adviceModels = data.docs.map((doc) {
        return AdviceModel(
          title: doc['title'],
        );
      }).toList();
      emit(
        AdviceState(
          documents: adviceModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          AdviceState(
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
