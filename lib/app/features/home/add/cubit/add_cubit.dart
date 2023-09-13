import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frozen_food/app/repositories/product_repository.dart';

part 'add_state.dart';
part 'add_cubit.freezed.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._productRepository) : super(AddState());

  final ProductRepository _productRepository;

  Future<void> add(
    String controllerName,
    String categories,
    DateTime today,
    DateTime dateTime,
    String controllerQuantity,
  ) async {
    try {
      await _productRepository.add(
          controllerName, categories, today, dateTime, controllerQuantity);
      emit(AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
