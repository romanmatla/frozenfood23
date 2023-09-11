import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../core/enums.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          const LoginState(
            status: Status.initial,
            email: '',
            password: '',
          ),
        );

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(
      const LoginState(
        status: Status.loading,
      ),
    );
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        const LoginState(
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        LoginState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(
      const LoginState(
        status: Status.loading,
      ),
    );
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        const LoginState(status: Status.success),
      );
    } catch (error) {
      emit(
        LoginState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
