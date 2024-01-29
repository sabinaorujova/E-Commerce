import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';

class ClickableText extends StatelessWidget {
  const ClickableText({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style:  TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ));
  }
}
