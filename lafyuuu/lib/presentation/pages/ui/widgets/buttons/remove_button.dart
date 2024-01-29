import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_colors.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete_outline,color: AppColors.grey,),
      onPressed: () {},
    );
  }
}
