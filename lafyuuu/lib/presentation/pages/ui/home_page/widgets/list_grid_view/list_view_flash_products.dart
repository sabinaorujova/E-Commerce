import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../cubits/home/home_cubit.dart';
import '../../../../../../utils/constants/box_sized.dart';
import '../../../flash_sale/flash_sale_page.dart';
import '../../../widgets/buttons/explore_product_button.dart';
import '../../../widgets/product_items/product_item.dart';

class ListViewFlashProducts extends StatelessWidget {
  const ListViewFlashProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Column(children: [
      ExploreProductButton(
        heading: 'See More',
        headingLink: 'Flash Sale',
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => HomeCubit()..getdatas(),
                        child: const FlashSalePage(),
                      )));
        },
      ),
      AppSizedbox.h16,
      SizedBox(
        height: 280.h,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: cubit.flashProducts!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final product = cubit.flashProducts![index];
            return ProductItem(
              product: product,
            );
          },
        ),
      )
    ]);
  }
}
