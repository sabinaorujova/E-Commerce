import 'package:flutter/material.dart';

import '../../widgets/buttons/explore_product_button.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ExploreProductButton(
            heading: ' Review Product', headingLink: 'See More'),
      ],
    ));
  }
}
