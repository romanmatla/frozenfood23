import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit() : super(AdviceState());
}
