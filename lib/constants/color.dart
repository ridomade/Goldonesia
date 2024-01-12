import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color white = HexColor("ffffff");
Color blue = HexColor("0766AD");
Color teal = HexColor("29ADb2");
Color lightGreen = HexColor("C5E898");
Color lightBlue = HexColor("FF7Ab6E3");
Color slightGrey = HexColor("F3F3F3");
