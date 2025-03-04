import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return GoogleFonts.quicksand().copyWith(
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    color: color,
  );
}

TextStyle getOrangeTextStyle({
  double fontSize = FontSizeManager.f45,
  FontWeight fontWeight = FontWeightManager.bold,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.fontFamily,
    fontWeight,
    ColorsManager.primary,
  );
}

TextStyle getGrey900TextStyle({
  double fontSize = FontSizeManager.f20,
  FontWeight fontWeight = FontWeightManager.semiBold,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.fontFamily,
    fontWeight,
    ColorsManager.grey900,
  );
}

TextStyle getRedTextStyle({
  double fontSize = FontSizeManager.f14,
  FontWeight fontWeight = FontWeightManager.semiBold,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.fontFamily,
    fontWeight,
    ColorsManager.secondary,
  );
}

TextStyle getGrey600TextStyle({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.medium,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.fontFamily,
    fontWeight,
    ColorsManager.grey600,
  );
}

TextStyle getWhiteTextStyle({
  double fontSize = FontSizeManager.f18,
  FontWeight fontWeight = FontWeightManager.medium,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstant.fontFamily,
    fontWeight,
    ColorsManager.white,
  );
}
