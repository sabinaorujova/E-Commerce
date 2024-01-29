import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/box_sized.dart';
import '../../../../utils/constants/padding.dart';
import '../../../../utils/constants/radiuses.dart';

class AccountRequest extends StatelessWidget {
  const AccountRequest({Key? key, required this.image, required this.title})
      : super(key: key);

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.h16,
      child: Container(
          height: 60.h ,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutralLight),
            borderRadius:AppRadiuses.c5
          ),
          child: Row(children: [
            Padding(
              padding:AppPaddings.l16,
              child: Image.asset(
                image,
                height: 24.h,
                width: 24.w,
              ),
            ),
            AppSizedbox.w32,
            Text(
              title,
              style:  TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neutralDark),
            ),
          ])),
    );
  }
}
