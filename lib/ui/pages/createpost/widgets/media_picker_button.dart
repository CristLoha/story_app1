import 'package:flutter/material.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';

class MediaPickerButtons extends StatelessWidget {
  final VoidCallback onGalleryTap;
  final VoidCallback onCameraTap;
    final VoidCallback onLocationPick;

  const MediaPickerButtons({
    required this.onGalleryTap,
    required this.onCameraTap,
    required this.onLocationPick,
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
            color: ColorsManager.green,
            size: AppSize.s30,
          ),
        ),
        IconButton(
          onPressed: onCameraTap,
          icon: Icon(Icons.camera_alt, size: AppSize.s30),
        ),
        IconButton(
          onPressed: onLocationPick,
          icon: Icon(Icons.location_on, color: ColorsManager.red, size: 30),
        ),
      ],
    );
  }
}
