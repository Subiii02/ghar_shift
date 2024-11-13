import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/size.dart';

import '../../../constants/colors.dart';

class SOutlinedButtonTheme{
  SOutlinedButtonTheme._();

  //light theme
static final LightOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(),
    foregroundColor: SDarkColor,
    side: BorderSide(color: SDarkColor),
    padding: EdgeInsets.symmetric(vertical: SButtonHeight),
  ),
);
 //Dark Theme
static final darkOutlinedButtonTheme= OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(),
    foregroundColor: SlightGray,
    side: BorderSide(color: SDarkColor),
    padding: EdgeInsets.symmetric(vertical: SButtonHeight),
  ),
);
}