import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_colors.dart';

class FavIconButton extends StatelessWidget {
  const FavIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite_outline,
        color: AppColors.grey,
        size: 24.sp,
      ),
      onPressed: () {},
    );
  }
}
