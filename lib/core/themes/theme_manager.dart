import 'package:fitness_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager {
  static ThemeData getTheme() {
    return ThemeData(useMaterial3: true, scaffoldBackgroundColor: ColorPalette.primaryColor,
    textTheme: TextTheme(
        titleLarge:TextStyle(
          fontFamily: "Lexend",
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: ColorPalette.mainTextColor
        ),
        headlineMedium: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 32,
          fontFamily: "Lexend",
          color: ColorPalette.mainTextColor
        )
    )
    );
  }
}