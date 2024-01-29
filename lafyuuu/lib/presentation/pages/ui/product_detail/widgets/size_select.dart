import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../cubits/detail/product_detail_cubit.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/box_sized.dart';

class SizeBox extends StatefulWidget {
  const SizeBox({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SizeBoxState createState() => _SizeBoxState();
}

class _SizeBoxState extends State<SizeBox> {
  int selectedContainerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();

    return Column(
     
      children: [
        Text(
          'Select Size',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.neutralDark,
          ),
        ),
        AppSizedbox.h8,
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            separatorBuilder: (context, index) => AppSizedbox.w8,
            shrinkWrap: true,
            itemCount: cubit.productDetail!.availableSizes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final availableSize = cubit.productDetail!.availableSizes[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedContainerIndex = index;
                    
                  });
                },
                child: Container(
                  height: 48.h,
                  width: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(66),
                    color: AppColors.white,
                    border: Border.all(
                      color: selectedContainerIndex == index
                          ? Colors.blue
                          : AppColors.neutralLight,
                      width: 1.w,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${availableSize.name}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: AppColors.neutralDark,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
