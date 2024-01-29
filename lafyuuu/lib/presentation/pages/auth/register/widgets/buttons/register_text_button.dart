import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../cubits/login/login_cubit.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_text.dart';
import '../../../login/login_page.dart';
import '../../../widgets/reg_login_text_button.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppTexts.checkSignIn,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14.sp, color: AppColors.grey),
        ),
        ClickableText(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        create: (context) => LoginCubit(),
                        child:const LoginPage())));
          },
          text: AppTexts.signIn,
        )
      ],
    );
  }
}
