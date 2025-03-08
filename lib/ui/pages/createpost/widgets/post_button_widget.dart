import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';

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
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        right: 10,
      ),
      child: FloatingActionButton(
        onPressed: isButtondisabled || isLoading ? null : onPressed,
        backgroundColor:
            isButtondisabled || isLoading
                ? ColorsManager.grey500
                : ColorsManager.primary,
        child:
            isLoading
                ? Lottie.asset(
                  'assets/lottie/loading_animation.json',
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                )
                : Icon(Icons.send, color: ColorsManager.white),
      ),
    );
  }
}
