part of 'login_cubit.dart';

@immutable
class LoginState {
  final Status status;
  // final bool isLoading;
  final String email;
  final String password;
  final User? user;
  final String errorMessage;

  const LoginState({
    this.status = Status.initial,
    // required this.isLoading,
    this.email = '',
    this.password = '',
    this.user,
    this.errorMessage = '',
  });
}
