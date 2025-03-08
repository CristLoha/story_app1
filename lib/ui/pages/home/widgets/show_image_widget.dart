import 'package:flutter/material.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';

class ShowImageWidget extends StatelessWidget {
  final String imageUrl;

  const ShowImageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      width: double.infinity,
      color: ColorsManager.softWhite,
      child:
          (imageUrl.isEmpty)
              ? _buildErrorImage()
              : Image.network(
                imageUrl,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return _buildErrorImage();
                },
              ),
    );
  }

  Widget _buildErrorImage() {
    return Center(
      child: Image.asset('assets/img/image_not_found.png', fit: BoxFit.cover),
    );
  }
}
