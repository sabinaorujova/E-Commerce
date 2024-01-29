import 'package:flutter/material.dart';

import '../../../widgets/buttons/explore_product_button.dart';

class TextButtonsCatagory extends StatelessWidget {
  const TextButtonsCatagory({super.key});

  @override
  Widget build(BuildContext context) {
    return ExploreProductButton(
      heading: 'Category',
      headingLink: 'More Category',
      onTap: () {},
    );
  }
}
