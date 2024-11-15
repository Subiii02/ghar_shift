import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/colors.dart';

class STextFormFieldTheme{
  STextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: SSecondaryColor,
        floatingLabelStyle: TextStyle(color: SSecondaryColor),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: SSecondaryColor),
        ));

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
        border: OutlineInputBorder(),
        prefixIconColor: SlightGray,
        floatingLabelStyle: TextStyle(color: SlightGray),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: SlightGray),

        ));

}