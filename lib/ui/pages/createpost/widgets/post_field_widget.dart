
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app1/utils/theme_manager/color_manager.dart';
import 'package:story_app1/utils/theme_manager/font_manager.dart';
import 'package:story_app1/utils/theme_manager/style_manager.dart';
import 'package:story_app1/utils/theme_manager/values_manager.dart';
import 'package:story_app1/providers/createpost/post_provider.dart';

class PostFieldWidget extends StatelessWidget {
  const PostFieldWidget({
    super.key,
    required TextEditingController descpritionC,
    required FocusNode focusNode,
  }) : _descpritionC = descpritionC, _focusNode = focusNode;

  final TextEditingController _descpritionC;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 10,
          bottom: 0,
          child: Container(
            width: 3,
            color: ColorsManager.grey600,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: AppPadding.p10),
          child: TextField(
            controller: _descpritionC,
            focusNode: _focusNode,
            maxLines: null,
            decoration: InputDecoration(
              hintText: "What's on your mind?",
              border: InputBorder.none,
              hintStyle: getGrey900TextStyle(
                fontSize: FontSizeManager.f18,
                fontWeight: FontWeightManager.regular,
              ),
            ),
            onChanged: (value) {
              context.read<PostProvider>().setDescription(
                value,
              );
            },
            keyboardType: TextInputType.multiline,
          ),
        ),
      ],
    );
  }
}
