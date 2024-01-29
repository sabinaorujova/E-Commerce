import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/box_sized.dart';

class ProductFeatures extends StatelessWidget {
  const ProductFeatures(
      {super.key,
     required  this.brand,
   required this.category,
   required this.description});
  final String brand;
  final String category;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:280.h,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
        'Specification',
        style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.neutralDark),
              ),
              AppSizedbox.h16,
              Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'shown',
            style: GoogleFonts.poppins(
                color: AppColors.neutralDark,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
          Text(
            brand,
            style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey),
          )
        ],
              ),
              AppSizedbox.h16,
              Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Category:',
            style: GoogleFonts.poppins(
                color: AppColors.neutralDark,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
          Text(
            category,
            style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey),
          )
        ],
              ),
              AppSizedbox.h16,
              Text(
        description,overflow: TextOverflow.ellipsis,
        maxLines: 6,
        style: GoogleFonts.poppins(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.grey),
              )
            ]));
  }
}
