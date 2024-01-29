import 'package:flutter/material.dart';

import '../../../widgets/global_widgets/global_input.dart';
import '../../../../../utils/constants/app_colors.dart';


class CustomAppbark extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbark({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          toolbarHeight: 80,
          backgroundColor: AppColors.white,
          elevation: 0,
          title: const GlobalInput(
              hintText: 'Search', prefixIcon: Icons.search_outlined),
          actions: [
            IconButton(
                onPressed: () {},
                color: AppColors.grey,
                iconSize: 30,
                icon: const Icon(Icons.favorite_border_rounded)),
            IconButton(
                onPressed: () {},
                color: AppColors.grey,
                iconSize: 30,
                icon: const Icon(Icons.notification_add_sharp)),
          ],
        ),
      ),
    );
  }
}
