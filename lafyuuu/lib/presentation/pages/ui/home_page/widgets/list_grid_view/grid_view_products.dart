import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../cubits/home/home_cubit.dart';

import '../../../widgets/product_items/product_item.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
      final cubit = context.read<HomeCubit>();
return
      GridView.builder(
        itemCount: cubit.recommendedProducts!.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          final product = cubit.recommendedProducts![index];
          return ProductItem(
            product: product,
          );
        },
      );
    }
  }

