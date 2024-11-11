import 'package:flutter/material.dart';

import '../widget_theme/text_theme.dart';


class SAppTheme{

  SAppTheme._();
  static ThemeData lightTheme = ThemeData(
      brightness:Brightness.light,
    textTheme:STextTheme.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
    textTheme: STextTheme.darkTextTheme,

  );
}