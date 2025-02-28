import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  const ButtonWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primary,
          foregroundColor: ColorsManager.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s30),
          ),
          minimumSize: Size(345, 55),
        ),

        child: Text(title, style: getWhiteTextStyle()),
      ),
    );
  }
}
