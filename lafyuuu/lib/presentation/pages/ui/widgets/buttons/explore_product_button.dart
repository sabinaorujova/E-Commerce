import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/constants/app_colors.dart';

class ExploreProductButton extends StatefulWidget {
   const ExploreProductButton({
   super.key,
    required this.heading,
    required this.headingLink,
    this.onTap,
  }) ;

  final String heading;
  final String headingLink;
  final void Function()? onTap;

  @override
  // ignore: library_private_types_in_public_api
  _ExploreProductButtonState createState() => _ExploreProductButtonState();
}

class _ExploreProductButtonState extends State<ExploreProductButton> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.headingLink,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.grey,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isTapped = !isTapped;
            });
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          child: Text(
            widget.heading,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
              color: isTapped ? AppColors.primaryColor : AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
