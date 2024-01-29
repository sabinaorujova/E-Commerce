import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/auth_response.dart';
import '../../data/services/login_service.dart';
import '../../utils/helpers/service_locator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState());

  late final LoginService _loginService = getIt.get();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final formKey = GlobalKey<FormState>(); 

  void login() async {
    try {
      emit(state.copyWith(isLoading: true, ));
      final AuthResponse? response = await _loginService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      if (response is AuthResponse) {
        emit(state.copyWith( hasData: true,));
      } else {
        emit(state.copyWith( hasError: true,  error: 'Login failed: Invalid response'));
      }
    } catch (e) {
     log ('error');
      emit(state.copyWith( hasError: true, error: e.toString()));
    }
  }

  void checkAndLogin() {
    if (formKey.currentState?.validate() ?? false) {
      login();
    } else {
      log('Form validation failed');
    }
  }
   void resetLoginState() {
    emit(state.copyWith(isLoading: false, hasError: false, hasData: false, error: ''));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}