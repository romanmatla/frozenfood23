import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frozen_food/app/models/advice_mode.dart';
import 'package:frozen_food/app/repositories/advice_repository.dart';
import 'package:meta/meta.dart';

import '../../../../core/enums.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit(this._adviceRepository)
      : super(const AdviceState(
          documents: [],
          //   errorMessage: '',
          //   isLoading: false,
          // ),
          status: Status.initial,
        ));

  final AdviceRepository _adviceRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AdviceState(
        status: Status.loading,

        documents: [],
        // errorMessage: '',
        // isLoading: true,
      ),
    );

    _streamSubscription = _adviceRepository.getAdviceStream().listen((data) {
      emit(
        AdviceState(
          status: Status.success,
          documents: data,
          // isLoading: false,
          // errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          const AdviceState(
            status: Status.error,
            documents: [],
            // isLoading: false,
            // errorMessage: error.toString(),
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
