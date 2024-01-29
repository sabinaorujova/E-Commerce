import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';
import '../../data/models/auth_response.dart';
import '../../data/services/register_service.dart';

import '../../utils/helpers/service_locator.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  late final RegisterService registerService;
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController confirmPassController = TextEditingController();
  late final TextEditingController fullNameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  late final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterInitial()) {
    registerService = getIt.get<RegisterService>();

    on<RegisterEvent>((event, emit) {
      if (event is RegisterButtonPressed) {
        checkAndRegister(event, emit);
      }
    });
  }

  void fregister(RegisterButtonPressed event, Emitter<RegisterState> emit) async {
    try {
      emit(RegisterLoading());
      final AuthResponse? response = await registerService.register(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (response is AuthResponse) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterError());
      }
    } on SocketException catch (_) {
      emit(RegisterNetwork());
    } catch (_) {
      emit(RegisterError());
    }
  }

  void checkAndRegister(RegisterButtonPressed event, Emitter<RegisterState> emit) {
    if ((formKey.currentState?.validate() ?? false) &&
        passwordController.text == confirmPassController.text) {
      fregister(event, emit);
    } else {
      emit(RegisterError()); 
    }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPassController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    return super.close();
  }
}
