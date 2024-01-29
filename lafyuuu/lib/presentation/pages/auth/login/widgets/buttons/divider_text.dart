import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/app_text.dart';
import '../../../../../../utils/constants/padding.dart';

class DividerText extends StatelessWidget {
  const DividerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.h16,
      child: Row(children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.neutralLight,
          ),
        ),
        Text(
          AppTexts.or,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.neutralLight,
          ),
        ),
      ]),
    );
  }
}
