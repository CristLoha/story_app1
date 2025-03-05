import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/providers/createpost/post_provider.dart';

class ShowImageWidget extends StatelessWidget {
  const ShowImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
  final postProvider = context.read<PostProvider>();
    final imagePath = postProvider.imagePath;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(File(imagePath.toString()), fit: BoxFit.cover),
          ),
          Positioned(
            top: 15,
            right: 20,
            child: GestureDetector(
              onTap: () {
                postProvider.setImagePath(null);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsManager.grey900,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.close,
                  color: ColorsManager.white,
                  size: AppSize.s20,
                ),
              ),
            ),
          ),
        ],
      ),
    );}
}