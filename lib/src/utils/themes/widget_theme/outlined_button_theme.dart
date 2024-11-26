import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/size.dart';

class SOutlinedButtonTheme{
  SOutlinedButtonTheme._();

  //light theme
  static final LightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: SSecondaryColor,
      side: const BorderSide(color: SSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: SButtonHeight),
    ),
  );
  //Dark Theme
  static final darkOutlinedButtonTheme= OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: SlightGray,
      side: const BorderSide(color: SSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: SButtonHeight),
    ),
  );
}