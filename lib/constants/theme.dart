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

    //* Outlined button style
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: whiteColor,
        foregroundColor: redColor,
        textStyle: const TextStyle(color: redColor),
        side: const BorderSide(
          color: redColor,
          width: 2,
        ),
      ),
    ),

    //* Elevated button style
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        disabledBackgroundColor: lightGrey,
      ),
    ),

    //* App bar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: redColor,
      elevation: 0,
      iconTheme: IconThemeData(color: whiteColor),
    ));

//* Input field border
OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: darkFontGrey),
  borderRadius: BorderRadius.circular(12),
);
