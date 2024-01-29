import 'package:flutter/material.dart';

class Snackbars {
 const  Snackbars._();
  static void show(context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(child: Text( text)),
        duration: const Duration(seconds: 3),
        backgroundColor: color,
        margin: const EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating));
  }
}
