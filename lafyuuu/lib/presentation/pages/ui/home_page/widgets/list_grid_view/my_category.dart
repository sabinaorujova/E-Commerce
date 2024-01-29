import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../cubits/home/home_cubit.dart';

import '../../../../../../utils/constants/box_sized.dart';

import '../../../widgets/buttons/explore_product_button.dart';
import 'catagory_model.dart';
import 'category_item.dart';

class MyCategory extends StatelessWidget {
  const MyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = context.read<HomeCubit>();
    
    return Column(
      children: [
       const ExploreProductButton(heading: 'Category', headingLink: 'More Category'),
        AppSizedbox.h8,
        SizedBox(
          height: 110.h,
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: cubit.categories!.length ,
              separatorBuilder: (context, index) => AppSizedbox.w8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                // ignore: unused_local_variable
                final item  = CategoryModel.category[index];
                final category = cubit.categories![index];
                return CategoryItem(
                  image: CategoryModel.category[index].imagePath,
                  name: category.name,
                );
              }),
        ),
      ],
    );
  }
}
