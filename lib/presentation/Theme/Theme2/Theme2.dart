import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/presentation/Theme/Theme2/Theme2Colors.dart';


class Theme2 {
  static ThemeData lightThemeData = ThemeData.light().copyWith(
      primaryColor: Theme2Colors.BezierColor1,
      secondaryHeaderColor: Theme2Colors.BezierColor2,
      appBarTheme: AppBarTheme(
          color: Theme2Colors.BezierColor1,
          iconTheme: const IconThemeData(color: Colors.white)),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Theme2Colors.BezierColor2));
}
