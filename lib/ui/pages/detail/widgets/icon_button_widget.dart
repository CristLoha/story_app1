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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: ColorsManager.grey900,
              blurRadius: 8,
              offset: Offset(2, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Icon(icon, color: ColorsManager.white, size: 30),
      ),
    );
  }
}
