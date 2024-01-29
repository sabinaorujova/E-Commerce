import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/constants/app_colors.dart';
import '../../../../../../utils/constants/box_sized.dart';
import '../../../../../../utils/constants/padding.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.h8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.white,
                border: const Border.fromBorderSide(
                    BorderSide(color: AppColors.neutralLight)),
                    ),
                    
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                width: 18.h,
                height: 18.w,
              ),
            ),
          ),
          AppSizedbox.h12,
          Text(
            name,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
