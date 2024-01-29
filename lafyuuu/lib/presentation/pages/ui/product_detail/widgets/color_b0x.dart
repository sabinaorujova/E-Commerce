import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../cubits/detail/product_detail_cubit.dart';
import '../../../../../utils/constants/app_colors.dart';
import '../../../../../utils/constants/padding.dart';

class ColorsBox extends StatefulWidget {
  const ColorsBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SizeBoxState createState() => _SizeBoxState();
}

class _SizeBoxState extends State<ColorsBox> {
  int selectedContainerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const  Text(
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.neutralDark,
          ),
          'Select Color',
        ),
        Padding(
          padding: AppPaddings.a16,
          child: SizedBox(
            height: 50.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cubit.productDetail!.availableColors.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final availableColor =
                    cubit.productDetail!.availableColors[index];

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = index;
                    });
                  },
                  child: Padding(
                    padding: AppPaddings.h8,
                    child: Container(
                      height: 48.r,
                      width: 48.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        border: Border.all(
                          color: selectedContainerIndex == index
                              ? Colors.blue
                              : AppColors.neutralLight,
                          width: 1.w,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          availableColor.name,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: AppColors.neutralDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
