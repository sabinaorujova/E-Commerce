import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_colors.dart';


class TitleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppbar(
      {super.key,
      required this.title,
       this.icon,
      this.searchicon,  this.icon2});
  final String title;
  final IconData? icon;
  final IconData? searchicon;
  final IconData? icon2;
  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(icon, color: AppColors.grey),
          onPressed: () {
              Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.neutralDark,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              searchicon,
              color: AppColors.grey,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              icon2,
              color: AppColors.grey,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
