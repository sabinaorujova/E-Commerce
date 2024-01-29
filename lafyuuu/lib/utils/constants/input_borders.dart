import 'package:flutter/material.dart';
import 'radiuses.dart';


class InputBorders {
  static inputBorder(Color borderColor) => OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
      ),
      borderRadius: AppRadiuses.a5);
}
