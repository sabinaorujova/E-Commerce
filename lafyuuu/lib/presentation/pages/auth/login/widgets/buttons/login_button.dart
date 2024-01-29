import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../cubits/home/home_cubit.dart';
import '../../../../../../cubits/login/login_cubit.dart';
import '../../../../widgets/global_widgets/global_button.dart';
import '../../../../../../utils/helpers/navigate.dart';
import '../../../../../../utils/constants/app_text.dart';
import '../../../../ui/home_page/home_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.hasData) {
          Navigate.to(
            context,
            BlocProvider(
              create: (context) => HomeCubit()..getdatas(),
              child: HomePage(),
            ),
          );
        } else if (state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed'),
              duration: Duration(seconds: 2),
            ),
          );

          cubit.resetLoginState();
        }
      },
      builder: (context, state) {
        return Button(
          title: AppTexts.signIn,
          isLoadings: state.isLoading,
          onTap: () => cubit.checkAndLogin(),
        );
      },
    );
  }
}
