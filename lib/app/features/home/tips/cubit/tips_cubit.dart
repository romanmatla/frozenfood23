import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frozen_food/app/models/tips_model.dart';
import 'package:frozen_food/app/repositories/tips_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enums.dart';

part 'tips_state.dart';
part 'tips_cubit.freezed.dart';

@injectable
class TipsCubit extends Cubit<TipsState> {
  TipsCubit({required this.tipsRepository})
      : super(const TipsState(
          result: [],
          status: Status.initial,
        ));

  final TipsRepository tipsRepository;

  Future<void> start({
    required String title,
  }) async {
    emit(const TipsState(status: Status.loading));
    try {
      final tipsModel = await tipsRepository.getTipsModels();
      emit(
        TipsState(
          result: tipsModel,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(TipsState(
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
