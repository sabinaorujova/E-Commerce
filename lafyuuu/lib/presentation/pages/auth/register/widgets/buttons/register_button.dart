import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../cubits/login/login_cubit.dart';
import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../../../cubits/register/register_state.dart';
import '../../../../widgets/global_widgets/global_button.dart';
import '../../../../../../utils/helpers/navigate.dart';
import '../../../../../../utils/constants/app_text.dart';
import '../../../login/login_page.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
      if (state is RegisterSuccess) {
        Navigate.to(context,BlocProvider(
            create: (context) => LoginCubit(), child: const LoginPage()));
      } else if (state is RegisterError) {
      }
    }, builder: (context, state) {
      return Button(
        title: AppTexts.signUp,
        isLoadings: state is RegisterLoading,
        onTap: () => cubit.checkAndRegister(),
      );
    });
  }
}
