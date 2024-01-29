import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/auth_response.dart';
import '../../data/services/login_service.dart';
import '../../utils/helpers/service_locator.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
 late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final formKey = GlobalKey<FormState>(); 
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is LoginButtonPressed) {
        checkAndLogin(event, emit);
      }
    });
  }
late final LoginService _loginnService = getIt.get();
 

  void fetchlogin(LoginButtonPressed event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading() );
      final AuthResponse? response = await _loginnService.login(
      email: emailController.text,
        password: passwordController.text,
      );
      if (response is AuthResponse) {
        emit(LoginSuccess());
      } else {
        emit(LoginNetwork());
      }
    } catch (e) {
   
      emit(LoginError(error: 'error'));
    }
  }

  void checkAndLogin(LoginButtonPressed event, Emitter<LoginState> emit) {
    if (formKey.currentState?.validate() ?? false) {
      fetchlogin(event,emit);
    } else {
      log('Form validation failed');
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
  
