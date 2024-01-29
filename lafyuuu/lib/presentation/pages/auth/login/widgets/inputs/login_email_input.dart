import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/login/login_cubit.dart';
import '../../../../widgets/global_widgets/global_input.dart';
import '../../../../../../utils/helpers/hive_boxes.dart';
import '../../../../../../utils/constants/app_text.dart';

class LoginEmailInput extends StatelessWidget {
  const LoginEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final bcubit = context.read<LoginCubit>();

    return GlobalInput(
      controller: bcubit.emailController,
      hintText: AppTexts.userName,
      prefixIcon: Icons.email_outlined,
       validate: (v) {
          if (v == '') {
            return 'Field cannot be empty';
          }
          return null;
        },onChanged: (value) {
        HiveBoxes.saveEmail(value); 
      },
    );
  }
}
