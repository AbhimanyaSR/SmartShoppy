import 'package:flutter/material.dart';
import 'package:smart_shopy/constants/colors.dart';

ThemeData themeData = ThemeData(
  //* Scaffold color
  scaffoldBackgroundColor: whiteColor,

  //* Text field style
  inputDecorationTheme: InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    prefixIconColor: redColor,
    suffixIconColor: redColor,
  ),

  //* Elevated button style
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: redColor, disabledBackgroundColor: lightGrey),
  ),
);

OutlineInputBorder outlineInputBorder =  OutlineInputBorder(
  borderSide: BorderSide(color: redColor),
  borderRadius: BorderRadius.circular(12),
);
