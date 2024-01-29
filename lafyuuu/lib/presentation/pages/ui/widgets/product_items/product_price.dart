import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../utils/constants/app_colors.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key, required this.price,
  });

  final String price;
  @override
  Widget build(BuildContext context) {
    return Text('$price\$',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
            color: AppColors.primaryColor));
  }
}
