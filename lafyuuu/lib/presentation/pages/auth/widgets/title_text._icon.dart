import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/box_sized.dart';

class TitleTextIcon  extends StatelessWidget {
  const TitleTextIcon({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);


  final String title;
  final String subTitle;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'images/png/logo.png',
          width: 72.w,
          height: 72.h,
        ),
       AppSizedbox.h16,
        Text(
          title,
          style: GoogleFonts.poppins(
            color:  AppColors.neutralDark,
            fontSize:  16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
       AppSizedbox.h16, 
        Text(
          subTitle,
          style: GoogleFonts.poppins(
            color: AppColors.grey,
            fontSize:  12.sp,
            fontWeight:  FontWeight.w400, 
          ),
        ),
      ],
    );
  }
}
