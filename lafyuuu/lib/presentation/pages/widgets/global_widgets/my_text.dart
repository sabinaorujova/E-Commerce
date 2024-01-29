import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_colors.dart';

class MyText extends StatelessWidget {
  const MyText(
      {super.key,
      required this.title,
       this.color,
     this.fontSize, this.fontWeight});

  final String title;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color??AppColors.grey,
      ),
    );
  }
}
