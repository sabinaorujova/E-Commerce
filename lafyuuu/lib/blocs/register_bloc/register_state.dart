
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

final class RegisterNetwork extends RegisterState {}

class RegisterError extends RegisterState {
  final String? error;

RegisterError({this.error});
}
