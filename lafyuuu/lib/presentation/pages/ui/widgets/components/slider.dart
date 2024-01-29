import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/app_colors.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key, required this.controller});

  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: const SlideEffect(
          spacing: 8.0,
          radius: 5,
          dotWidth: 8.0,
          dotHeight: 8.0,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 1.5,
          dotColor: AppColors.neutralLight,
          activeDotColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
