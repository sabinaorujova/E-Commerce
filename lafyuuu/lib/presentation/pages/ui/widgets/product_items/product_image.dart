import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.productimageUrl});

  final String productimageUrl;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      productimageUrl,
      fit: BoxFit.contain,
      width: 110.w,
      height: 100.h,
    );
  }
}
