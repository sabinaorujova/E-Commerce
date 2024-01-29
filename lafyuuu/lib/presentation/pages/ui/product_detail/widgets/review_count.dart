import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_colors.dart';

class ReviewCount extends StatelessWidget {
  const ReviewCount({super.key, required this.review});
  final int review;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$review',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.grey,
          ),
        ),
        Text(
          '(Review)',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
