import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/radiuses.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.onTap, required this.title, this.isLoadings=false});

  final void Function() onTap;
  final String title;
  final bool isLoadings;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: 343.h,
            height: 57.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: AppRadiuses.a5,
            ),
            child: Center(
              child: isLoadings
                  ? const CircularProgressIndicator.adaptive()
                  : Text(
                      title,
                      style:  TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
            )));
  }
}
