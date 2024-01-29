import 'package:flutter/material.dart';

import '../../../../../../utils/constants/padding.dart';
import '../../../widgets/buttons/search_button.dart';
import '../../../widgets/components/bottom_navi_bar.dart';

class HomeColumnView extends StatelessWidget {
  const HomeColumnView({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbark(),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
                  padding: AppPaddings.a16,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: children)))),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
