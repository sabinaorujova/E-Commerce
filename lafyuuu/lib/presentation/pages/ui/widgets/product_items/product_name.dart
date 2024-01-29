import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/app_colors.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        maxLines: 2,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 14.sp,
          color: AppColors.neutralDark,
        ).copyWith(overflow: TextOverflow.ellipsis));
  }
}
