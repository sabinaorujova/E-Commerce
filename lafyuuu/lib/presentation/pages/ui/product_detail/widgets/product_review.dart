import 'package:flutter/material.dart';

import '../../widgets/buttons/explore_product_button.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key, });

  @override
  Widget build(BuildContext context) {

    return  const Column(
      children: [
        ExploreProductButton(
            heading: ' Review Product', headingLink: 'See More',
        ),
        
      ],
    );
  }
}
