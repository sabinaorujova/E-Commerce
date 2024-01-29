import 'package:flutter/material.dart';

import '../../../../../utils/constants/box_sized.dart';

import '../../home_page/widgets/list_grid_view/grid_view_products.dart';
import '../../widgets/components/promotion.dart';

class FlashMegaView extends StatelessWidget {
  const FlashMegaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PromotionImage(
          image: 'images/png/promotionFirst.png',
          title: 'Super Flash Sale\n50% Sale',
        ),
        AppSizedbox.h16,
        GridViewProducts()
      ],
    );
  }
}
