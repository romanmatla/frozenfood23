import 'package:bloc/bloc.dart';
import 'package:frozen_food/app/repositories/product_repository.dart';
import 'package:meta/meta.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._productRepository) : super(const AddState());

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
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
