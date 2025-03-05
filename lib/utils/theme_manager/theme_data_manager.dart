import 'package:flutter/material.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primary,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsManager.white),
    ),
    fontFamily: FontFamilyConstant.fontFamily,
  );
}
