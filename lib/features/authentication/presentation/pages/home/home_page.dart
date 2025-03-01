import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_app1/core/theme_manager/color_manager.dart';
import 'package:story_app1/core/theme_manager/font_manager.dart';
import 'package:story_app1/core/theme_manager/style_manager.dart';
import 'package:story_app1/core/theme_manager/values_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Snap Story',
          style: getWhiteTextStyle().copyWith(fontSize: AppSize.s30),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.p50,
          horizontal: AppPadding.p24,
        ),
        children: [
          Row(
            spacing: 10,
            children: [
              CircleImageWidget(),

              Expanded(
                child: GestureDetector(
                  onTap: () => context.go('/home/post'),
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      color: ColorsManager.softWhite,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "What's on your mind?",
                        style: getGrey900TextStyle().copyWith(
                          fontWeight: FontWeightManager.regular,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class CircleImageWidget extends StatelessWidget {
  const CircleImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage('https://picsum.photos/200/200'),
    );
  }
}
