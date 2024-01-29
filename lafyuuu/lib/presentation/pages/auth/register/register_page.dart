import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/register/register_cubit.dart';
import '../widgets/auth_column_view.dart';
import 'widgets/buttons/register_button.dart';
import 'widgets/buttons/register_text_button.dart';
import 'widgets/inputs/full_name_inputs.dart';
import 'widgets/inputs/register_confirm_input.dart';
import 'widgets/inputs/register_email_input.dart';
import 'widgets/inputs/register_password_input.dart';
import 'widgets/components/register_logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Scaffold(
      body: AuthColumnView(
        formKey: cubit.formkey,
        children: [
          const RegisterLogo(),
          24.verticalSpace,
          const FullNameInputs(),
          12.verticalSpace,
          const RegisterEmailInput(),
          12.verticalSpace,
          const RegisterPasswordInput(),
          12.verticalSpace,
          const RegisterConfirmPassInput(),
          12.verticalSpace,
          const RegisterButton(),
          16.verticalSpace,
          const RegisterTextButton(),
        ],
      ),
    );
  }
}
