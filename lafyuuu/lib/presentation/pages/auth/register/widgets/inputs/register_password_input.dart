import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../widgets/global_widgets/global_input.dart';
import '../../../../../../utils/constants/app_text.dart';

class RegisterPasswordInput extends StatelessWidget {
  const RegisterPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return GlobalInput(
      controller: cubit.passwordController,
      isSecure: true,
      hintText: AppTexts.password,
      prefixIcon: Icons.lock_outline,
      validate: (v) {
        if (v!.isEmpty) {
          return AppTexts.errorEmpty;
        } else if (v.length < 6) {
          return AppTexts.errorLength;
        }
        return null;
      },
    );
  }
}
