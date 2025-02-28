import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/font_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  const TextFieldWidget({
    required this.hintText,
    required this.prefixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        hintStyle: getGrey900TextStyle(
          fontSize: FontSizeManager.f12,
          fontWeight: FontWeightManager.regular,
        ),
        prefixIcon: Icon(prefixIcon, color: ColorsManager.grey900),
        fillColor: ColorsManager.softWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s14),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}
