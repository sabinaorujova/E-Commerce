import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../widgets/global_widgets/global_input.dart';
import '../../../../../../utils/constants/app_text.dart';

class RegisterConfirmPassInput extends StatelessWidget {
  const RegisterConfirmPassInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return GlobalInput(
      controller: cubit.confirmPassController,
      isSecure: true,
      hintText: AppTexts.paswordAgain,
      prefixIcon: Icons.lock_outline,
      validate:  (v) {
      final password = cubit.passwordController.text;
         if (v!.isEmpty) {
          return AppTexts.errorEmpty;
        } else if (v != password) {
          return "Passwords do not match"; 
        } else if (v.length < 6) {
          return AppTexts.errorLength;
        }
        return null;
      }, 
    );
  }
}
