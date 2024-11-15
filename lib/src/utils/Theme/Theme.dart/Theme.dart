import 'package:flutter/material.dart';
import 'package:ghar_shift/src/utils/Theme/widget_theme/elevated_button_theme.dart';
import 'package:ghar_shift/src/utils/Theme/widget_theme/outlined_button_theme.dart';
import 'package:ghar_shift/src/utils/Theme/widget_theme/text_field_theme.dart';
import '../widget_theme/text_theme.dart';


class SAppTheme{

  SAppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness:Brightness.light,
    textTheme:STextTheme.lightTextTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.LightOutlinedButtonTheme,
    elevatedButtonTheme: SElevatedButtonTheme.LightElevatedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: STextTheme.darkTextTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme,
  );
}