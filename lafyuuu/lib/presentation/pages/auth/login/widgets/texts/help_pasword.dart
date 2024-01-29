import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_text.dart';

class HelpPasword extends StatelessWidget {
  const HelpPasword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      AppTexts.helpPassword,
      style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400),
    );
  }
}
