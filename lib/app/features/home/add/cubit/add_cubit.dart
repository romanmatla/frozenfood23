import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState());

  Future<void> add(
    String controllerName,
    String categories,
    DateTime today,
    DateTime _dateTime,
    String controllerQuantity,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('product').add(
        {
          'name': controllerName,
          'categories': categories,
          'date added': today,
          'expiration date': _dateTime,
          'quantity': controllerQuantity
        },
      );
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
