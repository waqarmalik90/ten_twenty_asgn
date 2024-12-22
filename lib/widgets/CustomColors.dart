import 'package:flutter/material.dart';

class CustomColors {
  static final DarkPrimaryColor =
  CustomColors.createMaterialColor(const Color(0xffF57C00));
  static final PrimaryColor =
      CustomColors.createMaterialColor(const Color(0xffFF9800));
  static final PrimaryColorLight =
      CustomColors.createMaterialColor(const Color(0xffFFE0B2));
  static final PrimaryColorLightest =
      CustomColors.createMaterialColor(const Color(0xff3E753A));
  static final AscentColor =
  CustomColors.createMaterialColor(const Color(0xffFFC107));
  static final PlaceHolderColor =
      CustomColors.createMaterialColor(const Color(0xff646464));
  static final SelectedGroupBtnColor =
  CustomColors.createMaterialColor(const Color(0xffd59f03));

  static final GetTicketsColor =
  CustomColors.createMaterialColor(const Color(0x0ff61C3F2));

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static int GetColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  static int GetColorFromHexWithOpacity(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "26$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }
}
