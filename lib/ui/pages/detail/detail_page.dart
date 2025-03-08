import 'package:flutter/material.dart';
import 'package:story_app1/data/model/story_model.dart';
import 'package:story_app1/ui/pages/home/widgets/show_image_widget.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';

class StoryDetailPage extends StatelessWidget {
  final StoryModel story;

  const StoryDetailPage({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail', style: getWhiteTextStyle())),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    story.name,
                    style: getGrey900TextStyle().copyWith(
                      fontSize: AppSize.s20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    story.description,
                    style: getGrey900TextStyle(
                      fontSize: FontSizeManager.f18,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            ShowImageWidget(imageUrl: story.photoUrl),

            const SizedBox(height: AppSize.s20),
          ],
        ),
      ),
    );
  }
}
