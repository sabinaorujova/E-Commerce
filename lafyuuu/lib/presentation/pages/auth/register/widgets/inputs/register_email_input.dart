import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../widgets/global_widgets/global_input.dart';
import '../../../../../../utils/constants/app_text.dart';

class RegisterEmailInput extends StatelessWidget {
  const RegisterEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return GlobalInput(
      hintText: AppTexts.youremail,
      prefixIcon: Icons.email_outlined,
      controller: cubit.emailController,
      validate: (v) {
          if (v == '') {
            return 'Field cannot be empty';
          }
          return null;
        },
    );
  }
}
