import 'package:flutter/material.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 30, width: 30, child: CircularProgressIndicator.adaptive()),
    );
  }
}
