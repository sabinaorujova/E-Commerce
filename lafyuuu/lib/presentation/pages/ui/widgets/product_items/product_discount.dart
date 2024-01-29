import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/constants/app_colors.dart';

class ProductDiscount extends StatelessWidget {
  const ProductDiscount({super.key, required this.disCount});
  final double? disCount;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$disCount',
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                  decoration: TextDecoration.lineThrough)),
          10.horizontalSpace,
          Text('24% Off',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.red,
              ))
        ],
      ),
    );
  }
}
