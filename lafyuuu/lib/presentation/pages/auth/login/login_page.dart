import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cubits/login/login_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../widgets/auth_column_view.dart';
import 'widgets/buttons/divider_text.dart';
import 'widgets/buttons/login_button.dart';
import 'widgets/buttons/login_text_button.dart';
import 'widgets/inputs/login_email_input.dart';
import 'widgets/inputs/login_logo.dart';
import 'widgets/inputs/login_password_input.dart';
import 'widgets/texts/fb_acount.dart';
import 'widgets/texts/google_acount.dart';
import 'widgets/texts/help_pasword.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: AuthColumnView(
        formKey: cubit.formKey,
        children: [
          const LoginLogo(),
          24.verticalSpace,
          const LoginEmailInput(),
          12.verticalSpace,
          const LoginPasswordInput(),
          12.verticalSpace,
          const LoginButton(),
          21.verticalSpace,
          const DividerText(),
          16.verticalSpace,
          const GoogleAcountRequest(),
          8.verticalSpace,
          const FbAcountRequest(),
          16.verticalSpace,
          const HelpPasword(),
          16.verticalSpace,
          const LoginTextButton(),
        ],
      ),
    );
  }
}
