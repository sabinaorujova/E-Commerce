abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

final class LoginNetwork extends LoginState {}

class LoginError extends LoginState {
  final String? error;

  LoginError({this.error});
}
