import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';

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
        backgroundColor: ColorsManager.primary, // Pakai warna primary
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
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ColorsManager.white,
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text('Loading', style: getWhiteTextStyle()),
                ],
              )
              : Text(title, style: getWhiteTextStyle()),
    );
  }
}
