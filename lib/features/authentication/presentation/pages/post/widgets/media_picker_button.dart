import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';

class MediaPickerButtons extends StatelessWidget {
  final VoidCallback onGalleryTap;
  final VoidCallback onCameraTap;

  const MediaPickerButtons({
    required this.onGalleryTap,
    required this.onCameraTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: onGalleryTap,
          icon: Icon(
            Icons.photo_library,
            color: ColorsManager.grey500,
            size: AppSize.s30,
          ),
        ),
        IconButton(
          onPressed: onCameraTap,
          icon: Icon(
            Icons.camera_alt,
            color: ColorsManager.grey500,
            size: AppSize.s30,
          ),
        ),
      ],
    );
  }
}
