import 'package:flutter/material.dart';

import '../../../../utils/constants/padding.dart';

class AuthColumnView extends StatelessWidget {
  const AuthColumnView(
      {super.key, required this.formKey, required this.children});
  final GlobalKey<FormState> formKey;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppPaddings.a16,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(children: children),
          ),
        ),
      ),
    );
  }
}
