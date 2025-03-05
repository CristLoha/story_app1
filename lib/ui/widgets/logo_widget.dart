import 'package:flutter/material.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Snap Story', style: getOrangeTextStyle()),
          Text(
            'Capture & Share Your Moments',
            style: getGrey900TextStyle(
              fontSize: FontSizeManager.f18,
              fontWeight: FontWeightManager.medium,
            ),
          ),
        ],
      ),
    );
  }
}
