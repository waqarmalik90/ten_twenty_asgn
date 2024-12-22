import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/presentation/Theme/Theme1/Theme1.dart';
import 'package:ten_twenty_asgn/presentation/Theme/Theme2/Theme2.dart';




enum ThemeKeys { THEME_1, THEME_2 }

class AppTheme {
  ThemeKeys themeKey= ThemeKeys.THEME_1;
   ThemeData getThemeFromKey() {
    switch (themeKey) {
      case ThemeKeys.THEME_1:
        return Theme1.lightThemeData;
      case ThemeKeys.THEME_2:

        return Theme2.lightThemeData;
      default:
        return Theme2.lightThemeData;
    }
  }
}

