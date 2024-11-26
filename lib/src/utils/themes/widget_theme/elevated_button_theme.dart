import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/size.dart';

class SElevatedButtonTheme{
  SElevatedButtonTheme._(); //to avoid creating instances

// light theme
  static final LightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(),
        foregroundColor: SlightGray,
        backgroundColor: SSecondaryColor,
        side: BorderSide(color: SSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: SButtonHeight)
    ),
  );

//Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(),
        foregroundColor: SSecondaryColor,
        backgroundColor: SlightGray,
        side: BorderSide(color: SSecondaryColor),
        padding: EdgeInsets.symmetric(vertical: SButtonHeight)
    ),
  );




}