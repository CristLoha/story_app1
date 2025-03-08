import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback? onPressed;

  const ButtonWidget({
    required this.title,
    this.isLoading = false,

    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        foregroundColor: ColorsManager.white,
        disabledBackgroundColor: ColorsManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s30),
        ),
        minimumSize: Size(345, 55),
      ),
      child:
          isLoading
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/white_loading_animation.json',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  Text('Loading...', style: getWhiteTextStyle()),
                ],
              )
              : Text(title, style: getWhiteTextStyle()),
    );
  }
}
