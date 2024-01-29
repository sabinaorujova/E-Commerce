part of 'login_cubit.dart';

class LoginState {
  final bool isLoading;
  final bool hasError;
  final bool hasData;
  final String? error;

  LoginState({
   this.isLoading =false,
     this.hasError=false,
     this.hasData=false,
    this.error,
  });

  LoginState copyWith({bool? isLoading, bool? hasError, bool? hasData, String? error}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      hasData: hasData ?? this.hasData,
      error: error ?? this.error,
    );
  }
}