import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../cubits/register/register_cubit.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_text.dart';
import '../../../register/register_page.dart';
import '../../../widgets/reg_login_text_button.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text( AppTexts.checkRegister,style: 
        TextStyle(fontSize: 14.sp,fontWeight: 
        FontWeight.w400,color: 
        AppColors.grey),),
        ClickableText(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (context) => RegisterCubit(),
                          child: const RegisterPage())));
            },
            text: AppTexts.register)
      ],
    );
  }
}
