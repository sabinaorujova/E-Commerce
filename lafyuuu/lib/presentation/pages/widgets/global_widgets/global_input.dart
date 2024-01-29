import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/constants/app_colors.dart';

class GlobalInput extends StatelessWidget {
  const GlobalInput({
    super.key,
    this.controller,
    required this.hintText,
    this.isSecure = false,
    this.prefixIcon,
    this.validate,
    this.color,
    this.onChanged,  this.maxLine =1,
  });

  final dynamic controller;
  final String hintText;
  final bool isSecure;
  final IconData? prefixIcon;
  final Color? color;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isSecure,
      validator: validate,
      maxLines: maxLine,
      decoration: InputDecoration(
          hintStyle: const TextStyle(color: AppColors.grey),
          fillColor: AppColors.neutralLight,
          filled: true,
          prefixIcon: prefixIcon == null
              ? null
              : Icon(prefixIcon, color: color ?? AppColors.grey, size: 24.sp),
          hintText: hintText,
          border: InputBorder.none,
          errorStyle: GoogleFonts.poppins(
              color: AppColors.red,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700)),
    );
  }
}
