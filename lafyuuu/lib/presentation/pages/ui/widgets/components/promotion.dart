import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/box_sized.dart';
import 'timer.dart';


class PromotionImage extends StatelessWidget {
  const PromotionImage({
    Key? key,
    required this.title,
    required this.image,
    this.subtitle,
    this.showTimer = true, 
  }) : super(key: key);

  final String title;
  final String image;
  final String? subtitle;
  final bool showTimer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 206.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:  TextStyle(
                color: AppColors.white,
                fontSize: 24 .sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            AppSizedbox.h32,
            if (showTimer) 
             const  TimerWidget(),
            AppSizedbox.h8,
            if (subtitle != null)
              Text(
                subtitle!,
                style: GoogleFonts.poppins(
                  color: AppColors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
          ],
        ),
      ),
    );
  }
}
