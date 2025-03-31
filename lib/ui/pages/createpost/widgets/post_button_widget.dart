import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';

class PostButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final bool isButtondisabled;
  final bool isLoading;
  const PostButtonWidget({
    super.key,
    required this.isButtondisabled,
    required this.isLoading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: isButtondisabled || isLoading ? null : onPressed,
      backgroundColor:
          isButtondisabled || isLoading
              ? ColorsManager.grey500
              : ColorsManager.primary,
      child:
          isLoading
              ? Lottie.asset(
                'assets/lottie/loading_animation.json',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              )
              : Text("Post", style: getWhiteTextStyle()),
    );
  }
}
