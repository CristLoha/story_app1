import 'package:flutter/material.dart';

class ColorsManager {
  static Color primary = HexColor.fromHex('#FF5722');
  static Color secondary = HexColor.fromHex('#F44336');
  static Color grey900 = HexColor.fromHex('#424242');
  static Color grey500 = HexColor.fromHex('#9E9E9E');
  static Color grey600 = HexColor.fromHex('#696B76');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color softWhite = HexColor.fromHex('#CCEBEAEA');
  static Color green = HexColor.fromHex('#4CAF50');
  static Color red = HexColor.fromHex('#FF5252');
  static Color orangeMedium = HexColor.fromHex('#FF9800');


}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.toUpperCase().replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
