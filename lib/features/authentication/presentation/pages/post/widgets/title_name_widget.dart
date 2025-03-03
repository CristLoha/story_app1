
import 'package:flutter/material.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';

class TitleNameWidget extends StatelessWidget {
  final String userName;
  const TitleNameWidget({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      userName,
      style: getGrey900TextStyle().copyWith(
        fontSize: AppSize.s18,
      ),
    );
  }
}
