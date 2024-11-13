import 'package:flutter/material.dart';
import 'package:ghar_shift/src/constants/colors.dart';
import 'package:ghar_shift/src/constants/size.dart';

class SElevatedButtonTheme{
  SElevatedButtonTheme._(); //to avoid creating instances

// light theme
static final LightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: SlightGray,
      backgroundColor: SDarkColor,
      side: BorderSide(color: SDarkColor),
      padding: EdgeInsets.symmetric(vertical: SButtonHeight)
  ),
);

//Dark Theme
static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: SDarkColor,
      backgroundColor: SlightGray,
      side: BorderSide(color: SDarkColor),
      padding: EdgeInsets.symmetric(vertical: SButtonHeight)
  ),
);




}