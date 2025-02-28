import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: getGrey900TextStyle());
  }
}
