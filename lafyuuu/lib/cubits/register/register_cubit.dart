import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/auth_response.dart';
import '../../data/services/register_service.dart';
import '../../utils/helpers/service_locator.dart';
import 'register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  late final RegisterService _registerService = getIt.get<RegisterService>();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController confirmPassController =TextEditingController();
  late final TextEditingController fullNameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();

  late final formkey = GlobalKey<FormState>();

  void register() async {
    try {
      emit(RegisterLoading());
      final AuthResponse? response = await _registerService.register(
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
    void checkAndRegister() {
      if ((formkey.currentState?.validate() ?? false) &&
          passwordController.text == confirmPassController.text) {
        register();
      } else {
        log('error');
      }}

      @override
      Future<void> close() {
        fullNameController.dispose();
        confirmPassController.dispose();
        emailController.dispose();
        passwordController.dispose();
        return super.close();
      }
    }
  

