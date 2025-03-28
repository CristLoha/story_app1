import 'package:flutter/material.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';

class TitleAppBarWidget extends StatelessWidget {
  final String title;
  const TitleAppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getWhiteTextStyle().copyWith(fontSize: AppSize.s24),
    );
  }
}
