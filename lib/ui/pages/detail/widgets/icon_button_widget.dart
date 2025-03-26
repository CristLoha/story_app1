import 'package:flutter/material.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';

class IconButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  const IconButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: ColorsManager.grey600, size: 30),
      onPressed: onPressed,
    );
  }
}
