import 'package:flutter/material.dart';

import '../../../widgets/components/promotion.dart';

class PromotionImageFlash extends StatelessWidget {
  const PromotionImageFlash({super.key});

  @override
  Widget build(BuildContext context) {
    return const PromotionImage(
      image: 'images/png/promotionFirst.png',
      title: 'Super Flash Sale\n50% Sale',
      showTimer: true,
    );
  }
}
