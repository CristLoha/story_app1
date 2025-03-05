import 'package:flutter/material.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';

class LogoWidget extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  const LogoWidget({
    super.key,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
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
