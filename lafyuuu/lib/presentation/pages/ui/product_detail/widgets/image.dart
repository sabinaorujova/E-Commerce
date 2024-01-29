import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../cubits/detail/product_detail_cubit.dart';

class ProductDetailImage extends StatelessWidget {
  const ProductDetailImage({
    Key? key,
    this.controller, 
  }) : super(key: key);

  final PageController? controller;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();
    return SizedBox(
        height: 300.h,
        child: PageView.builder(
          controller: controller,
          itemCount: cubit.productDetail!.images.length,
          itemBuilder: (context, index) {
            final data = cubit.productDetail!.images[index];
            return Image.network(
              data.image,
              fit: BoxFit.fill,
            );
          },
        ));
  }
}
