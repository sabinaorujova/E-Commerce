
 sealed class RegisterState {}
final class RegisterInitial extends RegisterState{}
final class RegisterLoading extends RegisterState{}
final class RegisterError extends RegisterState{}
final class RegisterNetwork extends RegisterState{}
final class RegisterSuccess extends RegisterState{}