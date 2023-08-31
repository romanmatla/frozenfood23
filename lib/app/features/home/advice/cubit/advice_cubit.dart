import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:frozen_food/app/repositories/tips_repository.dart';
import 'package:meta/meta.dart';

import '../../../../core/enums.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit(
    // this._adviceRepository,
    this.tipsRepository,
  ) : super(const AdviceState(
          result: [],
          //   errorMessage: '',
          //   isLoading: false,
          // ),
          status: Status.initial,
        ));

  final TipsRepository tipsRepository;

  Future<void> start({
    required String title,
  }) async {
    emit(const AdviceState(status: Status.loading));
    try {
      final tipsModel = await tipsRepository.getTipsModels();
      emit(
        AdviceState(
          result: tipsModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(const AdviceState(
        status: Status.error,
      ));
    }
  }

  // final AdviceRepository _adviceRepository;

  // StreamSubscription? _streamSubscription;

  // Future<void> start() async {
  //   emit(
  //     const AdviceState(
  //       status: Status.loading,

  //       documents: [],
  //       // errorMessage: '',
  //       // isLoading: true,
  //     ),
  //   );

  //   _streamSubscription = _adviceRepository.getAdviceStream().listen((data) {
  //     emit(
  //       AdviceState(
  //         status: Status.success,
  //         documents: data,
  //         // isLoading: false,
  //         // errorMessage: '',
  //       ),
  //     );
  //   })
  //     ..onError((error) {
  //       emit(
  //         const AdviceState(
  //           status: Status.error,
  //           documents: [],
  //           // isLoading: false,
  //           // errorMessage: error.toString(),
  //         ),
  //       );
  //     });
  // }

  // @override
  // Future<void> close() {
  //   _streamSubscription?.cancel();
  //   return super.close();
  // }
}
