import 'package:flutter/material.dart';
import 'package:ten_twenty_asgn/presentation/Theme/Theme1/Theme1Colors.dart';


class Theme1 {
  static ThemeData lightThemeData = ThemeData.light().copyWith(
      primaryColor: Theme1Colors.BezierColor1,
      textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white))),
      secondaryHeaderColor: Theme1Colors.BezierColor2,
      appBarTheme: AppBarTheme(
          color: Theme1Colors.BezierColor1,
          iconTheme: const IconThemeData(color: Colors.white)),

      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Theme1Colors.BezierColor2));
}
