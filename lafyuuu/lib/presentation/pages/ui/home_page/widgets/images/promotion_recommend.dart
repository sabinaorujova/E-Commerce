import 'package:flutter/material.dart';

import '../../../widgets/components/promotion.dart';

class PromotionRecommend extends StatelessWidget {
  const PromotionRecommend({super.key});

  @override
  Widget build(BuildContext context) {
    return const PromotionImage(
      title: 'Rocumended \n Product',
      subtitle: 'We recommend the best for you',
      image: 'images/png/promotionSecond.png',
      showTimer: false,
    );
  }
}
